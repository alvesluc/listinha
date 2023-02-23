import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/settings/services/settings_service.dart';
import 'package:listinha/src/shared/services/realm/models/settings_model.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SettingsServiceImpl implements SettingsService, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;

  SettingsServiceImpl(this.realm, this.appStore);

  @override
  void init() {
    final settings = _getSettings();
    appStore
      ..themeMode = _getThemeModeByName(settings.themeModeName)
      ..syncDate = settings.syncDate;

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode;
      final syncDate = appStore.syncDate;

      _saveSettings(themeMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  SettingsModel _getSettings() {
    return realm.all<SettingsModel>().first;
  }

  void _saveSettings(String themeModeName, DateTime? syncDate) {
    final model = _getSettings();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }

  @override
  void dispose() {
    disposer();
  }
}
