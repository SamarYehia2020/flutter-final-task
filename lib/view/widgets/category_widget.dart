import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/logic/controllers/FlutterTask_controller.dart';
import 'package:get/get.dart';

class CategorySliderWidget extends StatelessWidget {
  CarouselController control = CarouselController();
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var height = AppBar().preferredSize.height;

    return GetBuilder<FlutterTaskController>(builder: (controller) {
      if (controller.categories == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.categories!.isEmpty) {
        return Center(
          child: Text('Empty'),
        );
      } else {
        return OrientationBuilder(builder: (_, orientation) {
          if (orientation == Orientation.portrait) {
            return CarouselSlider.builder(
                itemCount: controller.categories!.length,
                carouselController: control,
                itemBuilder: (context, index, realIndex) => Container(
                    alignment: Alignment.center,
                    width: screenWidth * .45,
                    // color: Colors.amber,
                    margin: EdgeInsets.all(screenWidth * .006),
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: screenWidth * .20,
                              height: screenWidth * .20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(controller
                                          .categories![index]['image'])),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: GestureDetector(
                                onTap: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            controller.categories![index]['name'],
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ))
                        ])),
                options: CarouselOptions(
                  viewportFraction: .20,
                  autoPlay: true,
                  height: screenHeight * .15,
                  onPageChanged: (index, reason) {
                    categoryIndex = index;
                  },
                ));
          } else {
            return CarouselSlider.builder(
                itemCount: controller.categories!.length,
                carouselController: control,
                itemBuilder: (context, index, realIndex) => Container(
                    alignment: Alignment.center,
                    width: screenWidth * .45,
                    // color: Colors.amber,
                    margin: EdgeInsets.all(screenWidth * .006),
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: screenWidth * .20,
                              height: (screenHeight - height) * .25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(controller
                                          .categories![index]['image'])),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: GestureDetector(
                                onTap: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            controller.categories![index]['name'],
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ))
                        ])),
                options: CarouselOptions(
                  viewportFraction: .20,
                  autoPlay: true,
                  height: (screenHeight - height) * .4,
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
