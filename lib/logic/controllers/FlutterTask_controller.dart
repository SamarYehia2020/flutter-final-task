import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_task/logic/FlutterTask_model.dart';
import 'package:flutter_task/logic/sqldb.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FlutterTaskController extends GetxController {
  SqlDb sqlDb = SqlDb();
  List? addresses;
  List? categories;
  List? products;
  var isFavorites = false;
  var favorites = [];
  var favItem;

  @override
  void onInit() {
    readJson();
    super.onInit();
  }

  void addFavorites() {
    isFavorites = !isFavorites;
  }

  Future readJson() async {
    final String response =
        await rootBundle.loadString('assets/flutter_task.json');
    final data = await json.decode(response);
    addresses = data['addresses'];
    categories = data['categories'];
    products = data['products'];
    update();
  }

  void manageFavorites(pId) {
    products!.firstWhere((element) => element["id"] == pId);
    favorites.add(products!);
    // isFavoritess(pId);
    print(isFavoritess(pId));
    print(favorites);
    update();
  }

  bool isFavoritess(int pId) {
    return favorites.any((element) => element == pId);
  }
}
