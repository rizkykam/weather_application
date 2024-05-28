import 'package:flutter/material.dart';
import 'package:weather_application/const/extension_app.dart';
import 'package:weather_application/const/utils/utils.dart';
import 'package:weather_application/const/utils/weather_string.dart';
import 'package:weather_application/const/utils/weather_height.dart';
import 'package:weather_application/const/utils/weather_paddings.dart';

class SearchBottomWidget extends StatefulWidget {
  const SearchBottomWidget({super.key});

  @override
  State<SearchBottomWidget> createState() => _SearchBottomWidgetState();
}

class _SearchBottomWidgetState extends State<SearchBottomWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(WeatherPaddings.s16),
      height: 450,
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: WeatherAppString.search,
              border: const OutlineInputBorder(),
            ),
          ),
          WeatherHeight.h15.sizeHeight,
          ElevatedButton(
            onPressed: () {
              HomeUtils.searchCity(_controller.text, context);
              Navigator.pop(context);
            },
            child: Text(WeatherAppString.search),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
