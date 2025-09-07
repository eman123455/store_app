import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:store_app/models/products_model.dart';

class AddFavouriteProductController extends GetxController {
  Color? color;
  ProductsModel product;
  AddFavouriteProductController({required this.product});
  void toggle(Color col) {
    if (col == Colors.white) {
      color = Colors.red;
      product.isActive = true;
    } else if (col == Colors.red) {
      color = Colors.white;
      product.isActive = false;
    }
    update();
  }
}
