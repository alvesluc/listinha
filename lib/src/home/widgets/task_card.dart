import 'package:flutter/material.dart';
import 'package:listinha/src/shared/services/realm/models/tasks_model.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pendente'),
  completed(Icons.check, 'Completa'),
  disabled(Icons.cancel_outlined, 'Desativada');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.board});

  final Taskboard board;

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) return 0;
    final completed = tasks.where((e) => e.isCompleted = true).length;
    return completed / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    if (tasks.isEmpty) return '0/0';
    final completed = tasks.where((e) => e.isCompleted = true).length;
    return '$completed/${tasks.length}';
  }

  TaskCardStatus getStatus(Taskboard board, double progress) {
    if (!board.enabled) return TaskCardStatus.disabled;
    if (progress < 1.0) return TaskCardStatus.pending;
    return TaskCardStatus.completed;
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getProgressColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final title = board.title;
    final progress = getProgress(board.tasks);
    final progressText = getProgressText(board.tasks);

    final status = getStatus(board, progress);
    final statusText = status.text;
    final iconData = status.icon;

    final progressColor = getProgressColor(status, theme);
    final backgroundColor = getBackgroundColor(status, theme);

    return Container(
      height: 128,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: theme.iconTheme.color!.withOpacity(0.5),
              ),
              const Spacer(),
              Text(
                statusText,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall!.color!.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (board.tasks.isEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: progressColor,
                ),
                const SizedBox(height: 2),
                Text(
                  progressText,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodySmall!.color!.withOpacity(0.5),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
