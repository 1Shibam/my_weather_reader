import 'package:flutter/material.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';
import 'package:my_weather_reader/models/config/app_colors.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/animations/ERROR-OCCURED.png',
                fit: BoxFit.fitWidth,
                width: 400,
                height: 400,
              ),
            ),
          ),
          const SizedBox(height: 16), // Add spacing between sections
          Text(
            'The reason for this might be - ',
            style: TextStyle(
              fontFamily: Fonts.font1,
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8),
          _buildRowWithText(
            icon: Icons.wifi_off,
            text: 'Your internet connection might be off.',
          ),
          const SizedBox(height: 8),
          _buildRowWithText(
            icon: Icons.location_off,
            text: 'Check location-service (if you are looking for your own location).',
          ),
          const SizedBox(height: 8),
          _buildRowWithText(
            icon: Icons.spellcheck,
            text: 'Make sure there are no spelling mistakes.',
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }

  // Helper method to build rows
  Widget _buildRowWithText({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
        const SizedBox(width: 8),
        Icon(
          icon,
          color: Colors.red,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: Fonts.font1,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
