import 'package:danh_sach_san_pham_webapi/model/product.dart';
import 'package:dio/dio.dart';

class API {
  Future<List<Product>?> getAllProducts() async {
    List<Product>? products = null;
    String url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    var response = await dio.request(url, options: Options(method: 'GET'));
    if (response.statusCode == 200) {
      List lst = response.data;
      products = lst.map((pJson) => Product.fromJson(pJson)).toList();
    }
    return products;
  }
}
