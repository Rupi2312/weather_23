import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


class visibility_level extends StatelessWidget {
  const visibility_level({ required this.visibility_km, required this.visibililty_comment,}) ;


  final int visibility_km;
  final String visibililty_comment;



  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              mainAxisAlignment:  MainAxisAlignment.start,

              children: [
                Icon(Icons.remove_red_eye, size: 20.0, color: Colors.grey,),

                Text(  " VISIBILITY" , style: TextStyle(
                    fontSize: 15.0,color: Colors.grey
                ),),
              ],
            ),
            SizedBox(height: 5.0,),
            Text(visibility_km.toString() + " Km", style: TextStyle( fontSize: 30.0,

            ),),
            SizedBox(height: 20,),

            Text( visibililty_comment, style: TextStyle(fontSize: 15.0),)

          ],
        )
    );

  }
}
