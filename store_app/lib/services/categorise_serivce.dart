import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesService(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> listOfProduct = [];
    for (int i = 0; i < data.length; i++) {
      listOfProduct.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return listOfProduct;
  }
}
