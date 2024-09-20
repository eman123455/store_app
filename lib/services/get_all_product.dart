import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';
import 'package:http/http.dart' as http;

class GetAllProduct {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> dataList =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductsModel> productModelList =
        dataList.map((e) => ProductsModel.fromJson(e)).toList();

    return productModelList;
  }
}
