import 'package:flutter/material.dart';
import 'package:listinha/src/settings/services/settings_service.dart';
import 'package:listinha/src/shared/services/realm/models/settings_model.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class SettingsServiceImpl implements SettingsService {
  final Realm realm;
  final AppStore appStore;

  SettingsServiceImpl(this.realm, this.appStore);

  @override
  void init() {
    final configuration = _getConfiguration();
    appStore.themeMode.value = _getThemeModeByName(configuration.themeModeName);
    appStore.syncDate.value = configuration.syncDate;
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  SettingsModel _getConfiguration() {
    return realm.all<SettingsModel>().first;
  }

  void _saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = _getConfiguration();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
