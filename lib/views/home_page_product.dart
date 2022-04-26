// ignore_for_file: annotate_overrides, todo, unused_local_variable
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../services/dio_client.dart';
import '../services/new_services_api.dart';
import 'details/home_details_product.dart';
import 'package:lojatesteflutter/models/product.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ' Produtos ',
          style: TextStyle(
            color: Color(0xFF545D68),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Color(0xFF545D68),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, index) {
          return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return buildCard(
                    context, true, product, product.image.toString());
              });
        },
      ),
    );
  }

  Padding buildCard(
    BuildContext context,
    bool isFavorite,
    Product product,
    String imgProd,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CookieDetail(
                  productimage: imgProd,
                  productname: product.title,
                  productprice: product.price.toString(),
                  productdescription: product.description!)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1.0,
                    blurRadius: 1.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Color(0xFFEF7532),
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0xFFEF7532),
                          )
                  ],
                ),
              ),
              Hero(
                tag: imgProd,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          product.image.toString(),
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Text(
                product.price.toString(),
                style: TextStyle(color: Color(0xFFCC8053), fontSize: 16.0),
              ),
              Text(
                product.title!,
                style: TextStyle(color: Color(0xFF575E67), fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
