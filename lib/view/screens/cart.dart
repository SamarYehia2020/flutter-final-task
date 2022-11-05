import 'package:flutter/material.dart';
import 'package:flutter_task/logic/controllers/cart_controller.dart';
import 'package:flutter_task/theme/theme.dart';
import 'package:flutter_task/view/widgets/appbar_widget.dart';
import 'package:flutter_task/view/widgets/footer_widget.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppbarWidget(),
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 70),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cart",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                GetBuilder<CartController>(builder: (controller) {
                  if (controller.products == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.products!.isEmpty) {
                    return Center(
                      child: Text('Empty'),
                    );
                  } else {
                    return ListView.builder(
                      itemExtent: 100,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.products!.length,
                      itemBuilder: (context, index) => Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: DataTheme.secondaryColor,
                                      width: 1)),
                              child: Row(
                                children: [
                                  Image.asset(
                                      controller.products![index]['image'],
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products![index]['title'],
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        controller.products![index]['shipping'],
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${controller.products![index]['special']}" +
                                            " \$",
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                              BorderRadius.circular(10),
                                        )),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                DataTheme.cartIconsbg)),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: DataTheme.cartIconsfg,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                              BorderRadius.circular(10),
                                        )),
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                DataTheme.cartIconsbg)),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.remove,
                                      color: DataTheme.cartIconsfg,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 350,
            height: 70,
            child: FooterWidget(),
          ),
        ),
        GetBuilder<CartController>(builder: (controller) {
          return Positioned(
              bottom: 40,
              left: 130,
              child: Container(
                  // alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DataTheme.mainColor,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cart.png"))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Text(
                      "${controller.totalPrice}",
                      style: TextStyle(color: Colors.white),
                    ),
                  )));
        }),
      ]),
    ));
  }
}
