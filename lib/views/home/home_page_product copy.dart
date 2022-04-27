// ignore_for_file: annotate_overrides, todo, unused_local_variable, file_names, dead_code, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:lojatesteflutter/models/product.dart';
import 'package:lojatesteflutter/utils/constants.dart';
import 'package:lojatesteflutter/widgets/p_loading.dart';
import '../../controllers/home_controller.dart';
import '../../services/dio_client.dart';
import '../../services/new_services_api.dart';
import '../details/home_details_product.dart';

class HomeProductTESTE extends StatefulWidget {
  const HomeProductTESTE({Key? key}) : super(key: key);

  @override
  State<HomeProductTESTE> createState() => _HomeProductTESTEState();
}

class _HomeProductTESTEState extends State<HomeProductTESTE> {
  late Future<List<Product>> _future;
  Product? _product;

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
          'Produtos',
          style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.fetchAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return PLoading();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.count(
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                crossAxisCount: 2,
                children: List.generate(
                  controller.products.length,
                  (index) {
                    final product = controller.products[index];
                    return buildCard(
                      context,
                      true, // TODO: Verificar depois e ativar FAVORITOS!
                      product,
                      product.image.toString(),
                    );
                  },
                ),
              );
            }
            return Column(
              children: [
                Text(
                  'ERR -> ' + snapshot.connectionState.toString(),
                ),
              ],
            );
          },
        ),
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
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetail(
                  productimage: imgProd,
                  productname: product.title,
                  productprice: product.price.toString(),
                  productdescription: product.description!),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.005),
                spreadRadius: 2,
                blurRadius: 1,
              )
            ],
            color: AppColors.WHITE_COLOR,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: AppColors.ICON_COLOR,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: AppColors.ICON_COLOR,
                          )
                  ],
                ),
              ),
              Hero(
                tag: imgProd,
                // child: Padding(
                //   padding: EdgeInsets.all(8),
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          product.image.toString(),
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '\$${product.price.toString()}',
                style: TextStyle(
                  color: AppColors.PRIMARY_COLOR,
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  product.title!,
                  style: TextStyle(
                    color: AppColors.SECONDARY_COLOR,
                    fontSize: 12,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




    /*
      AnimatedBuilder(
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
    */