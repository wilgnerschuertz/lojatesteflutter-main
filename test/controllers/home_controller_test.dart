// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:lojatesteflutter/controllers/home_controller.dart';
import 'package:lojatesteflutter/models/product.dart';
import 'package:lojatesteflutter/services/new_services_api.dart';
import 'package:mocktail/mocktail.dart';

class ApiProductMock extends Mock implements ApiProduct {}

void main() {
  test('Deve preencher a lista corretamente', () async {
    final service = ApiProductMock();
    when(() => service.getProducts()).thenAnswer(
      (_) async => [
        Product(),
      ],
    );
    final controller = HomeController(service);
    await controller.fetchAllProducts();
    expect(controller.products.length, 1);
  });
}
