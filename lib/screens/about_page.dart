import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Description Section
            Text(
              "About Weather-Reader",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Weather-Reader provides real-time weather updates for any city in the world. "
              "Using data from the OpenWeatherMap API, it delivers accurate and up-to-date weather information "
              "with an intuitive and modern user interface.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Powered by OpenWeatherMap Section
            Text(
              "Powered by:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Icon(Icons.cloud, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "OpenWeatherMap API",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Social Links Section
            Text(
              "Connect with me:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),

            // GitHub Link
            Row(
              children: [
                Icon(Icons.code, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "GitHub",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // LinkedIn Link
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "LinkedIn",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            Spacer(),

            // Footer Section
            Center(
              child: Text(
                "Thank you for using Weather Reader!",
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  // Helper function to launch URLs