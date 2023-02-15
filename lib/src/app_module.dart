import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/settings/services/configuration_service.dart';
import 'package:listinha/src/settings/services/configuration_service_impl.dart';
import 'package:listinha/src/settings/settings_page.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

import 'home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<ConfigurationService>(
          (i) => ConfigurationServiceImpl(i.get()),
        ),
        Bind.singleton((i) => AppStore(i.get())),
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
