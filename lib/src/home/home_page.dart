import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/home_drawer.dart';
import 'package:listinha/src/shared/widgets/user_profile_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listinha'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: UserProfileButton(),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(
                    value: 0,
                    label: Text('Todos'),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('Pendentes'),
                  ),
                  ButtonSegment(
                    value: 2,
                    label: Text('Concluídas'),
                  ),
                  ButtonSegment(
                    value: 3,
                    label: Text('Desativadas'),
                  ),
                ],
                selected: const {1},
                onSelectionChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        label: const Text('Nova lista'),
      ),
    );
  }
}
