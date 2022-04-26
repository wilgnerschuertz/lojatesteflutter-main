// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:lojatesteflutter/utils/constants.dart';

class ProductDetail extends StatelessWidget {
  final productimage, productprice, productname, productdescription;

  ProductDetail({
    this.productimage,
    this.productprice,
    this.productname,
    this.productdescription,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.WHITE_COLOR,
        elevation: 0.2,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.ICON_COLOR,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Produto',
          style: TextStyle(
            fontSize: 20.0,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              productname,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.PRIMARY_COLOR,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Hero(
            tag: productimage,
            child: Image.network(productimage,
                height: 200, width: 150, fit: BoxFit.contain),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              '\$ ${productprice}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.PRIMARY_COLOR,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                productdescription,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 18),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: AppColors.BUTTON_COLOR,
                  ),
                  child: Center(
                      child: Text(
                    'Add to Basket',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))))
        ],
      ),
    );
  }
}
