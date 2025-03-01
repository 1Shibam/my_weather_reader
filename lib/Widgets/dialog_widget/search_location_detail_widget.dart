import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_reader/models/weather_model.dart';
import 'package:weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart'; // For formatting timestamps

void searchLocationDetailWidget(
    BuildContext context, WeatherModel weatherData) {
  String formatUnixTime(int timestamp, int timezone) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        (timestamp + timezone) * 1000,
        isUtc: true);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.darkBlue,
        title: Text(
          weatherData.cityName,
          style: AppTextStyles.heading1,
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 400.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(
                  _buildTile('Country', weatherData.country),
                  _buildTile('Lat.', weatherData.latitude),
                ),
                _buildRow(_buildTile('Lon.', weatherData.longitude),
                    _buildTile('Temp.', '${weatherData.temperature} °C')),
                _buildRow(
                    _buildTile('Min Temp', '${weatherData.minTemperature} °C'),
                    _buildTile('Max Temp', '${weatherData.maxTemperature} °C')),
                _buildRow(_buildTile('Humidity', '${weatherData.humidity}%'),
                    _buildTile('Wind Sp.', '${weatherData.windSpeed} m/s')),
                _buildRow(_buildTile('Wind Dir.', '${weatherData.windDeg}°'),
                    _buildTile('Desc.', weatherData.description)),
                _buildRow(_buildTile('Clouds', '${weatherData.cloudCoverage}%'),
                    _buildTile('Pressure', '${weatherData.pressure} hPa')),
                _buildRow(
                    _buildTile(
                        'Sunrise',
                        formatUnixTime(
                            weatherData.sunrise, weatherData.timezone)),
                    _buildTile(
                        'Sunset',
                        formatUnixTime(
                            weatherData.sunset, weatherData.timezone))),
                _buildTile(
                    'Searched On', formatUnixTime(weatherData.currentTime, 0)),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: AppTextStyles.heading2,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.waterBlue),
                child: TextButton(
                  onPressed: () async {
                    await ref
                        .read(weatherServiceNotifierProvider.notifier)
                        .searchLocation(weatherData.cityName);
                    if (context.mounted) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Search Again', style: AppTextStyles.heading2),
                ),
              );
            },
          )
        ],
      );
    },
  );
}

Widget _buildTile(String label, dynamic value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: ListTile(
      title: Text(label, style: AppTextStyles.regular),
      subtitle: Text(
        value.toString(),
        style: AppTextStyles.regular.copyWith(color: Colors.white70),
      ),
    ),
  );
}

Widget _buildRow(Widget first, Widget second) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(child: first),
      Expanded(child: second),
    ],
  );
}
