import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';

class AdsWidget extends StatelessWidget {
  AdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: DataTheme.adsBg, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        SizedBox(
          width: 100,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Mega"),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "WHOPP",
                  style: TextStyle(color: Color(0xff21114b), fontSize: 31),
                  children: [
                    TextSpan(
                      text: "E",
                      style:
                          TextStyle(color: DataTheme.mainColor, fontSize: 31),
                    ),
                    TextSpan(
                      text: "R",
                      style: TextStyle(color: Color(0xff21114b), fontSize: 31),
                    )
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("17"),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "32",
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "* Available until 24 December 2020",
              style: TextStyle(color: Colors.white, fontSize: 10),
            )
          ]),
        ),
      ]),
    );
  }
}
