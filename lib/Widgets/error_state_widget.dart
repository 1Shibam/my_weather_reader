import 'package:flutter/material.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';
import 'package:my_weather_reader/utils/app_colors.dart';

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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/animations/ERROR-OCCURED.png',
                fit: BoxFit.fitWidth, // Use your desired BoxFit option
                width: 400, // Adjust width as per your requirement
                height: 400,
              ),
            ),
          ),
          Text(
            'The reason for this might be - ',
            style: TextStyle(
                fontFamily: Fonts.font1, color: Colors.white, fontSize: 28),
          ),
          Row(
            children: [
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.wifi_off,
                color: Colors.red,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Your internet connection might be off.',
                style: TextStyle(
                    fontFamily: Fonts.font1, color: Colors.white, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.location_off,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Check location-service (if you are ',
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: Fonts.font1,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              Text(
                'looking for your own location).',
                maxLines: 2,
                style: TextStyle(
                    fontFamily: Fonts.font1, color: Colors.white, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.spellcheck,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Make sure there are no spelling ',
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: Fonts.font1,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              Text(
                'mistakes).',
                maxLines: 2,
                style: TextStyle(
                    fontFamily: Fonts.font1, color: Colors.white, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 28,
          )
        ],
      ),
    );
  }
}
