import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Description Section
            const Text(
              "About Weather-Reader",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Weather-Reader provides real-time weather updates for any city in the world. "
              "Using data from the OpenWeatherMap API, it delivers accurate and up-to-date weather information "
              "with an intuitive and modern user interface.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Powered by OpenWeatherMap Section
            const Text(
              "Powered by:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () => _launchURL("https://openweathermap.org/"),
              child: const Row(
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
            ),
            const SizedBox(height: 16),

            // Social Links Section
            const Text(
              "Connect with me:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            // GitHub Link
            GestureDetector(
              onTap: () =>
                  _launchURL("https://github.com/your-github-username"),
              child: const Row(
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
            ),
            const SizedBox(height: 12),

            // LinkedIn Link
            GestureDetector(
              onTap: () => _launchURL(
                  "https://www.linkedin.com/in/your-linkedin-username"),
              child: const Row(
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
            ),

            const Spacer(),

            // Footer Section
            const Center(
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

  // Helper function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw "Could not launch $url";
    }
  }
}
