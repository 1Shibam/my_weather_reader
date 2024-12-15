import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather_reader/Widgets/error_state_widget.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';
import 'package:my_weather_reader/Widgets/get_weather_animation.dart';
import 'package:my_weather_reader/Widgets/get_weather_icon.dart';
import 'package:my_weather_reader/Widgets/my_container.dart';
import 'package:my_weather_reader/utils/app_colors.dart';
import '../providers/weather_provider.dart';
import '../services/location_service.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lonController = TextEditingController();
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _getCurrentLocationWeather();
  }

  // Fetch weather data based on current location
  Future<void> _getCurrentLocationWeather() async {
    try {
      Position position = await _locationService.getCurrentLocation();
      ref
          .read(weatherProvider.notifier)
          .fetchWeatherByCoordinates(position.latitude, position.longitude);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to get location')));
    }
  }

  // Handle search by city name
  void _searchByCity() {
    ref
        .read(weatherProvider.notifier)
        .fetchWeatherByCity(_cityController.text.trim());
  }

  // Handle search by coordinates
  void _searchByCoordinates() {
    final lat = double.tryParse(_latController.text.trim());
    final lon = double.tryParse(_lonController.text.trim());
    if (lat != null && lon != null) {
      ref.read(weatherProvider.notifier).fetchWeatherByCoordinates(lat, lon);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid coordinates')));
    }
  }

  bool isDaytime(int currentTime, int sunrise, int sunset) {
    return currentTime >= sunrise && currentTime <= sunset;
  }

  String formatUnixTimestamp(int unixTimestamp, int timezoneOffset) {
    // Convert the Unix timestamp to DateTime
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
        (unixTimestamp + timezoneOffset) * 1000,
        isUtc: true);

    // Format the DateTime as a string (HH:mm format)
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return '$hours:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);

// Check if weather is not null before accessing its properties

    final sunSetTime = weatherState.weather != null
        ? formatUnixTimestamp(
            weatherState.weather!.sunset, weatherState.weather!.timezone)
        : 'No sunset data'; // Fallback value if weather is null

    final sunRiseTime = weatherState.weather != null
        ? formatUnixTimestamp(
            weatherState.weather!.sunrise, weatherState.weather!.timezone)
        : 'No sunrise data'; // Fallback value if weather is null

    return Scaffold(
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.darkBlue,
              AppColors.waterBlue,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20, top: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search by City
                searchCityBar(),

                const SizedBox(height: 8),

                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                const SizedBox(height: 8),

                longitudeAndLatitudeSearchField(),
                const SizedBox(
                  height: 16,
                ),

                // Weather Info from here

                //if the state is loading gif will be displayed
                if (weatherState.isLoading)
                  FadeInWidget(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          'assets/animations/LoadingState.gif',
                          fit:
                              BoxFit.fitWidth, // Use your desired BoxFit option
                          width: 400, // Adjust width as per your requirement
                          height: 400,
                        ),
                      ),
                    ),
                  )

                //if error occured then this state
                else if (weatherState.error.isNotEmpty)
                  const FadeInWidget(child: ErrorStateWidget())

                //if data is found this is the final state
                else if (weatherState.weather != null)
                  FadeInWidget(
                      child: _allWeatherData(
                          weatherState, sunRiseTime, sunSetTime)),
                FadeInWidget(child: poweredByOpenWeather())
              ],
            ),
          ),
        ),
      ]),
    );
  }

  SearchBar searchCityBar() {
    return SearchBar(
      controller: _cityController,
      textStyle: WidgetStatePropertyAll(TextStyle(
          fontFamily: Fonts.font1, fontSize: 20, color: AppColors.waterBlue)),
      side: const WidgetStatePropertyAll(
          BorderSide(color: AppColors.darkBlue, width: 1)),
      elevation: const WidgetStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)))),
      leading: const Icon(
        Icons.search_rounded,
        color: AppColors.waterBlue,
        size: 32,
      ),
      trailing: [
        IconButton(
            onPressed: _searchByCity,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.waterBlue,
              size: 32,
            ))
      ],
      hintText: 'Search another city',
      hintStyle: WidgetStatePropertyAll(TextStyle(
          fontFamily: Fonts.font1,
          color: AppColors.skyBlue.withOpacity(0.6),
          fontSize: 20)),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
    );
  }

  //all the weather data is displayed through this

  FadeInWidget _allWeatherData(
      WeatherState weatherState, String sunRiseTime, String sunSetTime) {
    return FadeInWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    weatherState.weather!.cityName,
                    style: TextStyle(
                        fontFamily: Fonts.font1,
                        color: Colors.white,
                        fontSize: 28),
                  ),
                  Row(
                    children: [
                      getWeatherIcon(
                        weatherState
                            .weather!.description, // Weather description
                        isDaytime(
                          weatherState
                              .weather!.currentTime, // Current time (dt)
                          weatherState
                              .weather!.sunrise, // Sunrise time (sys.sunrise)
                          weatherState
                              .weather!.sunset, // Sunset time (sys.sunset)
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        weatherState.weather!.description,
                        style: TextStyle(
                          fontFamily: Fonts.font1,
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  '${weatherState.weather!.temperature.toString()} °C',
                  style: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      fontFamily: Fonts.font1,
                      color: Colors.white,
                      fontSize: 36),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            child: getWeatherAnimation(
              weatherState.weather!.description, // Weather description
              isDaytime(
                weatherState.weather!.currentTime, // Current time (dt)
                weatherState.weather!.sunrise, // Sunrise time (sys.sunrise)
                weatherState.weather!.sunset, // Sunset time (sys.sunset)
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ExpansionTile(
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: AppColors.darkBlue.withOpacity(0.5),
                title: Text(
                  'Weather Details',
                  style: TextStyle(
                      fontFamily: Fonts.font1,
                      color: Colors.white,
                      fontSize: 24),
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myContainer('Humidity',
                                '${weatherState.weather!.humidity}%'),
                            myContainer('Pressure',
                                '${weatherState.weather!.pressure} hPa'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myContainer('Min. Temp.',
                                '${weatherState.weather!.tempMin}°C'),
                            myContainer('Max. Temp.',
                                '${weatherState.weather!.tempMax}°C'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myContainer('Wind Speed',
                                '${weatherState.weather!.windSpeed} m/s'),
                            myContainer('Wind Deg.',
                                '${weatherState.weather!.windDeg}°'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myContainer('Sunrise', sunRiseTime),
                            myContainer('Sunset', sunSetTime),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

// Extracted method for longitude and latitude search fields
  Row longitudeAndLatitudeSearchField() {
    return Row(
      children: [
        // Latitude TextField
        Expanded(
          child: TextField(
            controller: _latController,
            style: TextStyle(
                fontFamily: Fonts.font1,
                fontSize: 20,
                color: AppColors.waterBlue),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              filled: true, // Enables background color
              fillColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.never,

              labelText: 'Latitude',
              labelStyle: TextStyle(
                  color: AppColors.skyBlue.withOpacity(0.6),
                  fontSize: 20,
                  fontFamily: Fonts.font1),
              hintText: '00.0000',
              hintStyle: TextStyle(
                  color: AppColors.skyBlue.withOpacity(0.6),
                  fontSize: 20,
                  fontFamily: Fonts.font1),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: AppColors.darkBlue)),
            ),
          ),
        ),
        const SizedBox(width: 32), // Spacer between the fields
        // Latitude TextField
        Expanded(
          child: TextField(
            controller: _lonController,
            style: TextStyle(
                fontFamily: Fonts.font1,
                fontSize: 20,
                color: AppColors.waterBlue),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              filled: true, // Enables background color
              fillColor: Colors.white,
              labelText: 'Longitude',
              floatingLabelBehavior: FloatingLabelBehavior.never,

              labelStyle: TextStyle(
                  color: AppColors.skyBlue.withOpacity(0.6),
                  fontSize: 20,
                  fontFamily: Fonts.font1),
              hintText: '00.0000',
              hintStyle: TextStyle(
                  color: AppColors.skyBlue.withOpacity(0.6),
                  fontSize: 20,
                  fontFamily: Fonts.font1),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: AppColors.lightBlueShade,
                    width: 4,
                  )),
            ),
          ),
        ),

        IconButton(
            onPressed: _searchByCoordinates,
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 40,
            ))
      ],
    );
  }
}

Align poweredByOpenWeather() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Powered By",
          style: TextStyle(
              fontSize: 20, fontFamily: Fonts.font1, color: Colors.white),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "OpenWeatherMap",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontFamily: 'Arial', // Replace with Fonts.font1 if available
          ),
        ),
      ],
    ),
  );
}
