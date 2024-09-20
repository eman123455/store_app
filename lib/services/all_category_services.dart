import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';


class AllCategoryServices {
  Future<List<dynamic>> getAllProducts() async {
    List<Map<String, dynamic>> dataList =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
  
  
   return dataList;

}
  
}
