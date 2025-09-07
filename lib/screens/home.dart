import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/favourite_screen.dart';
import 'package:store_app/widgets/home_body_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<ProductsModel> favoriteProducts = [];
  int index = 0;
  var page = pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) {
              setState(() {
                this.index = index;
              });
            },
            destinations:const  [
             NavigationDestination(
                icon: Icon(Icons.home),
                label: '',
              ),
             NavigationDestination(
                icon: Icon(Icons.search),
                label: '',
              ),
               NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: '',
              ),
               NavigationDestination(
                icon: Icon(Icons.person),
                label: '',
              ),
            ]));
  }
}
