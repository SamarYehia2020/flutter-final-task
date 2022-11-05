import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';
import 'package:flutter_task/view/widgets/addresses_widget.dart';
import 'package:flutter_task/view/widgets/ads_widget.dart';
import 'package:flutter_task/view/widgets/appbar_widget.dart';
import 'package:flutter_task/view/widgets/category_widget.dart';
import 'package:flutter_task/view/widgets/deals_widget.dart';
import 'package:flutter_task/view/widgets/footer_widget.dart';
import 'package:flutter_task/view/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var height = AppBar().preferredSize.height;

    return SafeArea(
        child: Scaffold(
            appBar: AppbarWidget(),
            body: OrientationBuilder(builder: (_, orientation) {
              if (orientation == Orientation.portrait) {
                return Stack(children: [
                  Container(
                      width: screenWidth,
                      height: screenHeight - height,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Column(
                          children: [
                            Container(
                                width: screenWidth,
                                height: (screenHeight - height) * .10,
                                child: SearchWidget()),
                            Container(
                              width: screenWidth,
                              height: (screenHeight - height) * .12,
                              child: AddressesWidget(),
                            ),
                            //categories widget
                            Container(
                              width: screenWidth,
                              height: (screenHeight - height) * .20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Explore by Category",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("See All (36)")
                                      ]),
                                  CategorySliderWidget()
                                ],
                              ),
                            ),
                            //deals widget
                            Container(
                              width: screenWidth,
                              height: (screenHeight - height) * .20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Deals of the day",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DealsWidget()
                                ],
                              ),
                            ),
                            AdsWidget(),
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: screenWidth,
                      height: (screenHeight - height) * .10,
                      child: FooterWidget(),
                    ),
                  ),
                  Positioned(
                      bottom: (screenHeight - height) * .05,
                      left: screenWidth * .40,
                      child: Container(
                          // alignment: Alignment.center,
                          width: screenWidth * .20,
                          height: (screenHeight - height) * .10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: DataTheme.mainColor,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/cart.png"))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: InkWell(
                              onTap: () {
                                print((screenHeight - height).toString());
                              },
                              child: Text(
                                "Cart",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))),
                ]);
              } else
                return Stack(children: [
                  Container(
                      width: screenWidth,
                      height: screenHeight - height,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Column(
                          children: [
                            Container(
                                width: screenWidth * .7,
                                height: (screenHeight - height) * .30,
                                child: SearchWidget()),
                            Container(
                              // color: Colors.amber,
                              width: screenWidth,
                              height: (screenHeight - height) * .40,
                              child: AddressesWidget(),
                            ),
                            //categories widget
                            Container(
                              // color: Colors.amber,
                              width: screenWidth,
                              height: (screenHeight - height) * .5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Explore by Category",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("See All (36)")
                                      ]),
                                  Container(
                                      width: screenWidth,
                                      height: (screenHeight - height) * .4,
                                      child: CategorySliderWidget())
                                ],
                              ),
                            ),
                            //deals widget
                            Container(
                              width: screenWidth,
                              height: (screenHeight - height) * .70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Deals of the day",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: screenWidth,
                                      height: (screenHeight - height) * .50,
                                      child: DealsWidget())
                                ],
                              ),
                            ),
                            Container(
                                width: screenWidth,
                                height: (screenHeight - height) * .7,
                                child: AdsWidget()),
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: screenWidth,
                      height: (screenHeight - height) * .30,
                      child: FooterWidget(),
                    ),
                  ),
                  Positioned(
                      bottom: (screenHeight - height) * .20,
                      left: screenWidth * .40,
                      child: Container(
                          // alignment: Alignment.center,
                          width: screenWidth * .15,
                          height: (screenHeight - height) * .30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: DataTheme.mainColor,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/cart.png"))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: InkWell(
                              onTap: () {
                                print((screenHeight - height).toString());
                              },
                              child: Text(
                                "Cart",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))),
                ]);
            })));
  }
}
