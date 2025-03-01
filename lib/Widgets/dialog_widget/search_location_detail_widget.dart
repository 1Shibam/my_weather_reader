import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting timestamps

void searchLocationDetailWidget(BuildContext context, Map<String, dynamic> weatherData) {
  String formatUnixTime(int timestamp) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(weatherData['cityName'] ?? 'Weather Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Country', weatherData['country']),
              _buildInfoRow('Latitude', weatherData['lat']),
              _buildInfoRow('Longitude', weatherData['lon']),
              _buildInfoRow('Temperature', '${weatherData['temperature']} °C'),
              _buildInfoRow('Min Temp', '${weatherData['tempMin']} °C'),
              _buildInfoRow('Max Temp', '${weatherData['tempMax']} °C'),
              _buildInfoRow('Humidity', '${weatherData['humidity']}%'),
              _buildInfoRow('Wind Speed', '${weatherData['windSpeed']} m/s'),
              _buildInfoRow('Wind Direction', '${weatherData['windDeg']}°'),
              _buildInfoRow('Description', weatherData['description']),
              _buildInfoRow('Cloud Coverage', '${weatherData['cloudCoverage']}%'),
              _buildInfoRow('Pressure', '${weatherData['pressure']} hPa'),
              _buildInfoRow('Sunrise', formatUnixTime(weatherData['sunrise'])),
              _buildInfoRow('Sunset', formatUnixTime(weatherData['sunset'])),
              _buildInfoRow('Searched On', formatUnixTime(weatherData['currentTime'])),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              // Handle search again action
            },
            child: const Text('Search Again'),
          ),
        ],
      );
    },
  );
}

Widget _buildInfoRow(String label, dynamic value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value?.toString() ?? '-'),
      ],
    ),
  );
}
