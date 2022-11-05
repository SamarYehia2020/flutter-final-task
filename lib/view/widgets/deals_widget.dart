import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';
import 'package:flutter_task/view/screens/home.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_task/logic/controllers/FlutterTask_controller.dart';
import 'package:get/get.dart';

class DealsWidget extends StatelessWidget {
  CarouselController control = CarouselController();
  int categoryIndex = 0;
  final flutter_task = Get.find<FlutterTaskController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var height = AppBar().preferredSize.height;
    return GetBuilder<FlutterTaskController>(builder: (controller) {
      if (controller.products == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.products!.isEmpty) {
        return Center(
          child: Text('Empty'),
        );
      } else {
        return OrientationBuilder(builder: (_, orientation) {
          if (orientation == Orientation.portrait) {
            return CarouselSlider.builder(
                itemCount: controller.products!.length,
                carouselController: control,
                itemBuilder: (context, index, realIndex) => Container(
                      width: screenWidth * .81,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: DataTheme.secondaryColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: screenWidth * .28,
                                height: screenWidth * .28,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(controller
                                            .products![index]["image"])),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                              ),
                              GetBuilder<FlutterTaskController>(
                                builder: (controller) => Positioned(
                                    top: screenWidth * -.013,
                                    left: screenWidth * -.013,
                                    child: Container(
                                      width: screenWidth * .085,
                                      height: screenWidth * .085,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: IconButton(
                                          onPressed: () async {
                                            controller.manageFavorites(
                                                controller.products![index]
                                                    ["id"]);
                                          },
                                          icon: controller.isFavoritess(
                                                      controller
                                                              .products![index]
                                                          ["id"]) ==
                                                  true
                                              ? Icon(
                                                  LineAwesomeIcons.heart_1,
                                                  size: 15,
                                                )
                                              : Icon(
                                                  LineAwesomeIcons.heart,
                                                  size: 15,
                                                )),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.products![index]["title"],
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pieces ${controller.products![index]["quantity"]}",
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.products![index]["shipping"],
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                      "${controller.products![index]["special"]}"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.products![index]["price"]}",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size.zero),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 2)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                DataTheme.cartIconsbg)),
                                    onPressed: () async {
                                      int response =
                                          await controller.sqlDb.insertData('''
                                    INSERT INTO orders (`product_id`,`title`,`quantity`,`shipping`,`image`,`price`,`special`)
                                    VALUES (
                                    "${controller.products![index]["id"]}",
                                    "${controller.products![index]["title"]}",
                                    1,
                                    "${controller.products![index]["shipping"]}",
                                    "${controller.products![index]["image"]}",
                                    "${controller.products![index]["price"]}",
                                    "${controller.products![index]["special"]}"
                                    )
                                    ''');

                                      if (response > 0) {
                                        Get.defaultDialog(
                                            contentPadding: EdgeInsets.all(15),
                                            title: 'Message',
                                            titleStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              height: 1.6,
                                              color: Color(0xff47B6DA),
                                            ),
                                            content: Text(
                                              "Product ${controller.products![index]["title"]} added successfully ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                height: 1.6,
                                                color: Color(0xff474749),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            cancel: Container(
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Get.offAndToNamed(
                                                      "/HomeScreen");
                                                },
                                                child: Text('متابعة'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xffE8F0F7),
                                                  onPrimary: Color(0xff2B76B7),
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Tajawal',
                                                      color: Color(0xff2B76B7),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ));
                                      }
                                    },
                                    child: Icon(
                                      LineAwesomeIcons.shopping_cart,
                                      color: DataTheme.cartIconsfg,
                                      size: screenWidth * .085,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                options: CarouselOptions(
                  viewportFraction: .7,
                  autoPlay: true,
                  padEnds: false,
                  height: screenWidth * .28,
                  onPageChanged: (index, reason) {
                    categoryIndex = index;
                  },
                ));
          } else {
            return CarouselSlider.builder(
                itemCount: controller.products!.length,
                carouselController: control,
                itemBuilder: (context, index, realIndex) => Container(
                      width: screenWidth * .81,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: DataTheme.secondaryColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: screenWidth * .28,
                                height: screenWidth * .28,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(controller
                                            .products![index]["image"])),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                              ),
                              Positioned(
                                  top: screenWidth * -.013,
                                  left: screenWidth * -.013,
                                  child: Container(
                                    width: screenWidth * .085,
                                    height: screenWidth * .085,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          LineAwesomeIcons.heart,
                                          size: 15,
                                        )),
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.products![index]["title"],
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pieces ${controller.products![index]["quantity"]}",
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.products![index]["shipping"],
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                      "${controller.products![index]["special"]}"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.products![index]["price"]}",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size.zero),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 2)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        )),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                DataTheme.cartIconsbg)),
                                    onPressed: () async {
                                      int response =
                                          await controller.sqlDb.insertData('''
                                    INSERT INTO orders (`product_id`,`title`,`quantity`,`shipping`,`image`,`price`,`special`)
                                    VALUES (
                                    "${controller.products![index]["id"]}",
                                    "${controller.products![index]["title"]}",
                                    1,
                                    "${controller.products![index]["shipping"]}",
                                    "${controller.products![index]["image"]}",
                                    "${controller.products![index]["price"]}",
                                    "${controller.products![index]["special"]}"
                                    )
                                    ''');

                                      if (response > 0) {
                                        Get.defaultDialog(
                                            contentPadding: EdgeInsets.all(15),
                                            title: 'Message',
                                            titleStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              height: 1.6,
                                              color: Color(0xff47B6DA),
                                            ),
                                            content: Text(
                                              "Product ${controller.products![index]["title"]} added successfully ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                height: 1.6,
                                                color: Color(0xff474749),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            cancel: Container(
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Get.offAndToNamed(
                                                      "/HomeScreen");
                                                },
                                                child: Text('متابعة'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xffE8F0F7),
                                                  onPrimary: Color(0xff2B76B7),
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Tajawal',
                                                      color: Color(0xff2B76B7),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ));
                                      }
                                    },
                                    child: Icon(
                                      LineAwesomeIcons.shopping_cart,
                                      color: DataTheme.cartIconsfg,
                                      size: screenWidth * .085,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                options: CarouselOptions(
                  viewportFraction: .7,
                  autoPlay: true,
                  padEnds: false,
                  height: screenWidth * .28,
                  onPageChanged: (index, reason) {
                    categoryIndex = index;
                  },
                ));
          }
        });
      }
    });
  }
}
