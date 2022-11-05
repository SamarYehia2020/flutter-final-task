import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';
import 'package:flutter_task/view/screens/cart.dart';
import 'package:flutter_task/view/screens/home.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FooterWidget extends StatefulWidget {
  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        mouseCursor: MouseCursor.defer,
        selectedItemColor: DataTheme.mainColor,

        // selectedLabelStyle: ThemeApp.light.textTheme.headline6,
        unselectedItemColor: DataTheme.footerIconColor,
        backgroundColor: DataTheme.secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Get.toNamed("HomeScreen");
                },
                child: Icon(LineAwesomeIcons.alternate_store)),
            label: 'Grocery',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.bell),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.bell,
              size: 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Get.toNamed("CartScreen");
                },
                child: Icon(LineAwesomeIcons.wallet)),
            label: 'Cart',
          ),
        ]);
  }
}
