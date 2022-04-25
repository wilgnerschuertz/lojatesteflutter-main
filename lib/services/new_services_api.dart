// ignore_for_file: prefer_final_fields, unused_import

import 'package:dio/dio.dart';
import '../models/product.dart';
import 'http_client_interface.dart';

const _url = "https://fakestoreapi.com/products";

class ApiProduct {
  final IHttpClient client;

  ApiProduct(this.client);

  Future<List<Product>> getProducts() async {
    final body = await client.get(_url);
    // final body = response.data as List;
    return (body as List).map((e) => Product.fromJson(e)).toList();

    // final todos = body.map((e) => Product.fromJson(e)).toList();
    // .map((e) => Product(
    //       title: e['title'],
    //       price: e['price'],
    //       description: e['description'],
    //     ))
    // .toList();
    // return todos;

    /*
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
