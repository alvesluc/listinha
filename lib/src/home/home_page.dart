import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/home_drawer.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/tasks_model.dart';
import 'package:listinha/src/shared/widgets/user_profile_button.dart';
import 'package:realm/realm.dart';

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
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 72,
                left: 20,
                right: 20,
                bottom: 120,
              ),
              itemCount: 20,
              itemBuilder: (_, i) {
                final model = Taskboard(Uuid.v4(), 'Lista de tarefas');
                return TaskCard(board: model);
              },
              separatorBuilder: (_, i) {
                return const SizedBox(height: 12);
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  selected: const {3},
                  onSelectionChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, './edit');
        },
        icon: const Icon(Icons.edit),
        label: const Text('Nova lista'),
      ),
    );
  }
}
