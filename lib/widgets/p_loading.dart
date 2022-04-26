import 'package:flutter/material.dart';

class PLoading extends StatelessWidget {
  const PLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
