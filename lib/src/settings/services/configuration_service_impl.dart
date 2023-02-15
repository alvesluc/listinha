import 'package:listinha/src/settings/services/configuration_service.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }
}
