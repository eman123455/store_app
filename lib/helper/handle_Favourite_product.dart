import 'package:store_app/constants.dart';
import 'package:store_app/models/products_model.dart';

void handleFavouriteProduct(bool isActive, ProductsModel product) {
  if (isActive) {
    if(!favouriteProducts.contains(product)){
    favouriteProducts.add(product);
    }
  } else {
    favouriteProducts.remove(product);
  }
}
