// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_weather_reader/Widgets/error_state_widget.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _startLoadingTimeout();
  }

  void _startLoadingTimeout() {
    Timer(const Duration(seconds: 15), () {
      if (isLoading) {
        setState(() {
          isError = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isError
          ? const ErrorStateWidget()
          : FadeInWidget(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/animations/LoadingState.gif',
                    fit: BoxFit.fitWidth,
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
            ),
    );
  }
}
