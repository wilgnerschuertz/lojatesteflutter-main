// ignore_for_file: prefer_final_fields, unused_import

import 'package:dio/dio.dart';
import '../models/product.dart';
import '../widgets/failure.dart';
import 'http_client_interface.dart';

const _url = "https://fakestoreapi.com/products";

abstract class IAPIproduct {
  Future<List<Product>> getProducts();
}

class ApiProduct implements IAPIproduct {
  final IHttpClient client;
  ApiProduct(this.client);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final body = await client.get(_url);
      // final body = response.data as List;
      return (body as List).map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      throw Failure(
        message: 'Não foi possível carregar os dados',
      );
    }

    /*
    final todos = body.map((e) => Product.fromJson(e)).toList();
    .map((e) => Product(
          title: e['title'],
          price: e['price'],
          description: e['description'],
        ))
    .toList();
    return todos;

  int? id;
  String? title;
  double? price;
  String? description;
  Category? category;
  String? image;
  Rating? rating;
    */
  }
}
