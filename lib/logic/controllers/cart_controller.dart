import 'package:flutter_task/logic/sqldb.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  SqlDb sqlDb = SqlDb();
  List? products;
  RxInt totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getroducts();
    getTotalPrice();
  }

  Future getroducts() async {
    List response = await sqlDb.readData("SELECT * FROM orders");
    products = response;
    update();
  }

  Future getTotalPrice() async {
    List response =
        await sqlDb.readData("SELECT quantity*special as TOTAL FROM  orders ");

    if (response.isNotEmpty) {
      for (var element in response) {
        totalPrice.value += int.parse(element['TOTAL'].toString());
      }
    } else {
      totalPrice = 0.obs;
    }
  }
}
