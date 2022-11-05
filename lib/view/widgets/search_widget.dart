import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.amber,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintText: "search in southands of products",
            contentPadding: EdgeInsets.only(top: 10),
            enabled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: DataTheme.footerIconColor)),
            enabledBorder: OutlineInputBorder(
                gapPadding: 20,
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: DataTheme.secondaryColor))),
      ),
    );
  }
}
