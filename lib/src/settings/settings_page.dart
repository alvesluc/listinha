import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _ConfigurationPage();
}

class _ConfigurationPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

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
            groupValue: appStore.themeMode.value,
            title: const Text('Sistema'),
            onChanged: appStore.changeThemeMode,
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: appStore.themeMode.value,
            title: const Text('Claro'),
            onChanged: appStore.changeThemeMode,
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: appStore.themeMode.value,
            title: const Text('Escuro'),
            onChanged: appStore.changeThemeMode,
          ),
          const SizedBox(height: 8),
          Text(
            'Controle de dados',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: appStore.clearConfigurations,
            child: const Text(
              'Apagar cache e reiniciar app',
            ),
          )
        ],
      ),
    );
  }
}
