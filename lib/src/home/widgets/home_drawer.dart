import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>((store) => store.syncDate);
    final syncDate = appStore.syncDate.value;

    var syncDateText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/mm/yyyy às hh:mm');
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settings');
        }
      },
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Opções',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Sincronizar'),
              const SizedBox(width: 8),
              Text(
                syncDateText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
