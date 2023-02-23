import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/settings/services/settings_service.dart';
import 'package:listinha/src/settings/services/settings_service_impl.dart';
import 'package:listinha/src/settings/settings_page.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

import 'home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.singleton<SettingsService>(
          (i) => SettingsServiceImpl(i.get<Realm>(), i.get<AppStore>()),
        ),
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
