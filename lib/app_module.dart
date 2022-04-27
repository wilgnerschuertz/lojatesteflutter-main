// // ignore_for_file: override_on_non_overriding_member

// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:lojatesteflutter/controllers/app_widget.dart';
// import 'package:lojatesteflutter/services/dio_client.dart';

// import 'controllers/home_controller.dart';
// import 'services/new_services_api.dart';
// import 'views/home/home_page_product copy.dart';

// class AppModule extends Module {
//   @override
//   List<Bind> get binds => [
//         Bind.singleton(
//           (i) => DioClient(),
//         ),
//         Bind.singleton(
//           (i) => ApiProduct(
//             i(),
//           ),
//         ),
//         Bind.singleton(
//           (i) => HomeController(
//             i(),
//           ),
//         ),
//       ];

//   @override
//   List<ModularRoute> get routes => [
//         ChildRoute(
//           '/',
//           child: (_, __) => HomeProductTESTE(),
//         ),
//       ];
// }
