import 'package:store_app/screens/add_to_cart_page.dart';
import 'package:store_app/screens/favourite_screen.dart';
import 'package:store_app/screens/profile_page.dart';
import 'package:store_app/screens/search_page.dart';
import 'package:store_app/widgets/home_body_page.dart';
import 'package:store_app/models/products_model.dart';


var pages =  [
   HomePageBody(),
  SearchPage(),
  AddToCartPage(),
  FavouriteScreen(favouriteProducts: favouriteProducts,),
  ProfilePage()
];

List<ProductsModel> favouriteProducts = [];
