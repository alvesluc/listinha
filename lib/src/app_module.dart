import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/settings/settings_page.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

import 'home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppStore()),
        // AutoBind.singleton(AppStore.new)
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ChildRoute(
          '/settings',
          child: (context, args) => const SettingsPage(),
        ),
      ];
}
