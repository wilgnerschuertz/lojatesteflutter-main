// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/new_services_api.dart';

class HomeController extends ChangeNotifier {
  final ApiProduct _service;
  HomeController(this._service);

  var products = <Product>[];

  Future<void> fetchAllProducts() async {
    products = await _service.getProducts();
    notifyListeners();
  }
}
