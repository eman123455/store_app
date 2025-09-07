import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/constants.dart';
import 'package:store_app/screens/favourite_screen.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id:(context)=>const HomeScreen(),
        UpdateProductScreen.id:(context)=>UpdateProductScreen(),
        FavouriteScreen.id:(context)=> FavouriteScreen(favouriteProducts: favouriteProducts,)

      },
      initialRoute: HomeScreen.id,
    );
  }
}
