// import 'package:flutter/material.dart';

// import '../../common/repositories/pokemon_repository.dart';
// import 'screens/details/container/detail_container.dart';
// import 'screens/home/container/home_container.dart';
// import 'services/new_services_api.dart';
// import 'views/details/home_details_product.dart';
// import 'widgets/home_container.dart';

// class ShopRoute extends StatelessWidget {
//   const ShopRoute({Key? key, required this.repository}) : super(key: key);
//   final ApiProduct repository;
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       initialRoute: '/',
//       onGenerateRoute: (settings) {
//         if (settings.name == '/') {
//           return MaterialPageRoute(
//             builder: (context) {
//               return HomeContainer(
//                 repository: repository,
//                 onItemTap: (route, arguments) {
//                   Navigator.of(context).pushNamed(route, arguments: arguments);
//                 },
//               );
//             },
//           );
//         }

//         if (settings.name == '/details') {
//           return MaterialPageRoute(
//             builder: (context) {
//               return ProductDetail(
//                 repository: repository,
//                 arguments: (settings.arguments as DetailArguments),
//                 onBack: () => Navigator.of(context).pop(),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
