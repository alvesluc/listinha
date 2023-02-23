import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/settings/services/settings_service_impl.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _ConfigurationPage();
}

class _ConfigurationPage extends State<SettingsPage> {
  final appStore = Modular.get<AppStore>();
  final settingsService = Modular.get<SettingsServiceImpl>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    context.select(() => appStore.themeMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listinha'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        children: [
          Text(
            'Configurações',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Tema',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          RadioListTile<ThemeMode>(
            value: ThemeMode.system,
            groupValue: appStore.themeMode,
            title: const Text('Sistema'),
            onChanged: _changeThemeMode,
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: appStore.themeMode,
            title: const Text('Claro'),
            onChanged: _changeThemeMode,
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: appStore.themeMode,
            title: const Text('Escuro'),
            onChanged: _changeThemeMode,
          ),
          const SizedBox(height: 8),
          Text(
            'Controle de dados',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: settingsService.deleteAll,
            child: const Text(
              'Apagar cache e reiniciar app',
            ),
          )
        ],
      ),
    );
  }
}
