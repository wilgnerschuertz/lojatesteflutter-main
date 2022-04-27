// ignore_for_file: annotate_overrides, todo, unused_local_variable
import 'package:flutter/material.dart';
import 'package:lojatesteflutter/models/product.dart';
import 'package:lojatesteflutter/utils/constants.dart';
import '../../controllers/home_controller.dart';
import '../../services/dio_client.dart';
import '../../services/new_services_api.dart';
import '../details/home_details_product.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key, required this.list}) : super(key: key);

  final List<Product> list;

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
      body: GridView.count(
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
      ),
    );

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
  }

  Padding buildCard(
    BuildContext context,
    bool isFavorite,
    Product product,
    String imgProd,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 1, bottom: 1, left: 1, right: 1),
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
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
              color: AppColors.WHITE_COLOR),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
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
                child: Container(
                  height: 80,
                  width: 80,
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
                height: 10,
                // width: 10,
              ),
              Text(
                '\$ ${product.price.toString()}',
                style: TextStyle(
                  color: AppColors.PRIMARY_COLOR,
                  fontSize: 16.0,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                product.title!,
                style: TextStyle(
                  color: AppColors.SECONDARY_COLOR,
                  fontSize: 10.0,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
