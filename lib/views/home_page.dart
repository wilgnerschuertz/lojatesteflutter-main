// ignore_for_file: unused_local_variable, prefer_const_constructors_in_immutables, todo

import 'package:flutter/material.dart';
import 'package:lojatesteflutter/services/dio_client.dart';
import '../controllers/home_controller.dart';
import '../services/new_services_api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiProduct(
      DioClient(),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState -> chama todos os produtos

    super.initState();
    controller.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, widget) {
            return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        product.title!,
                      ),
                      subtitle: Text(
                        product.price.toString(),
                      ),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 44,
                            maxHeight: 44),
                        child: Image.network(
                          product.image.toString(),
                        ),
                      ),
                    ), elevation: 2,
                  );
                });
          }),
    );
  }
}
