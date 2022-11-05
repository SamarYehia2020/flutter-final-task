import 'package:flutter/material.dart';
import 'package:flutter_task/theme/theme.dart';
import 'package:flutter_task/logic/controllers/FlutterTask_controller.dart';
import 'package:get/get.dart';

class AddressesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlutterTaskController>(builder: (controller) {
      if (controller.addresses == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.addresses!.isEmpty) {
        return Center(
          child: Text('Empty'),
        );
      } else {
        return OrientationBuilder(builder: (_, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              color: Colors.amber,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.addresses!.length,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: DataTheme.secondaryColor, width: 1)),
                        child: Row(
                          children: [
                            Image.asset(controller.addresses![index]["image"],
                                width: 50, height: 50, fit: BoxFit.cover),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.addresses![index]["title"],
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.addresses![index]["city"],
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.addresses![index]["street"],
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
            );
          } else
            return Container(
              // color: Colors.amber,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.addresses!.length,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: DataTheme.secondaryColor, width: 1)),
                        child: Row(
                          children: [
                            Image.asset(controller.addresses![index]["image"],
                                width: 50, height: 50, fit: BoxFit.cover),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.addresses![index]["title"],
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.addresses![index]["city"],
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.addresses![index]["street"],
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
            );
        });
      }
    });
  }
}
