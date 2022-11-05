import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor:
          Color(0xffffffff).withOpacity(0), // Don't show the leading button
      title: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: DataTheme.mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(100))),
              padding:
                  EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Icon(LineAwesomeIcons.map_marker),
                  Text(
                    "Moustafa St...",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.only(top: 10),

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  border: Border.all(
                    color: Color(0xfff1f1f1),
                    width: 2,
                  )),
            )
            // Your widgets here
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
