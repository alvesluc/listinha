import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
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
                '08/02/2023 às 23:36',
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
