import 'package:flutter_modular/flutter_modular.dart';
import 'package:lojatesteflutter/services/dio_client.dart';
import 'package:lojatesteflutter/views/home_page.dart';

import 'controllers/home_controller.dart';
import 'services/new_services_api.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => DioClient(),
        ),
        Bind.singleton(
          (i) => ApiProduct(
            i(),
          ),
        ),
        Bind.singleton(
          (i) => HomeController(
            i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => HomePage())];
}
