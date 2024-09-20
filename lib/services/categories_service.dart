import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class CategoriesService {
  Future<List<dynamic>> getProductByCategoryName(String categoryName) async {
    List<dynamic> dataList = await Api().get(url: ('https://fakestoreapi.com/products/category/$categoryName'));

  
      List<ProductsModel> productModelList =
          dataList.map((e) => ProductsModel.fromJson(e)).toList();

      return productModelList;
  
  }
}
