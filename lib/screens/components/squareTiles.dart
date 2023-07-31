import 'package:flutter/material.dart';


class squareTile extends StatelessWidget {
  const squareTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            mainAxisAlignment:  MainAxisAlignment.start,
            children: [
              Icon(Icons.sunny, size: 20.0, color: Colors.grey,),

              Text(  " UV Index" , style: TextStyle(
                  fontSize: 15.0,color: Colors.grey
              ),),
            ],
          ),
          Text("0", style: TextStyle( fontSize: 30.0,

          ),),
          Text("Low", style: TextStyle(
            fontSize: 25.0
          ),),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape:
              RoundSliderThumbShape(enabledThumbRadius: 0.0),
              overlayShape:
              RoundSliderOverlayShape(overlayRadius: 0.0),
              thumbColor: Color(0xFFEB1555),
              activeTrackColor: Colors.pink,

              inactiveTrackColor: Color(0xFF8D8E98),
            ),
            child: Slider(
              value: 18.toDouble(),
              max: 35.0,
              min: 0.0, onChanged: (double value) {  },

            ),
          ),
          Text("Low Levels all day", style: TextStyle(fontSize: 15.0),)

        ],
      )
    );

  }
}
