import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class UVIndex extends StatelessWidget {
  const UVIndex({
    required this.UvLevel_num,
    required this.UvLevel_String,
    required this.UvLevel_Comment,
  });

  final double UvLevel_num;
  final String UvLevel_String;
  final String UvLevel_Comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.sunny,
          size: 20.0,
          color: Colors.grey,
        ),
        Text(
          " UV Index",
          style: TextStyle(fontSize: 15.0, color: Colors.grey),
        ),
      ],
    ),
    Text(
      UvLevel_num.toInt().toString(),
      style: TextStyle(
        fontSize: 30.0,
      ),
    ),
    Text(
      UvLevel_String,
      style: TextStyle(fontSize: 25.0),
    ),
    SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 3.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 3.0),
        thumbColor: Colors.white,

        //    activeTrackColor: Colors.MaterialAccentColor(_yellowAccentPrimaryValue, <int, Color>{100 : Color(0xFFFFFF8D), 200 : Color(_yellowAccentPrimaryValue), 400 : Color(0xFFFFEA00), 700 : Color(0xFFFFD600)}),

        inactiveTrackColor: Color(0xFF8D8E98),
      ),
      child: Slider(
        value: UvLevel_num,
        max: 35.0,
        min: 0.0,
        onChanged: (double value) {},
      ),
    ),
    Text(
      UvLevel_Comment,
      style: TextStyle(fontSize: 15.0),
    )
      ],
    );
  }
}
