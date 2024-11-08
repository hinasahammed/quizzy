import 'package:flutter/material.dart';

class QuizHistory extends StatelessWidget {
  const QuizHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.history, color: theme.colorScheme.primary),
          title: Text("Quiz ${index + 1}"),
          subtitle: Text("Score: ${index * 10 + 50}"), // Dummy score
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Navigate to detailed quiz result
          },
        );
      },
    );
  }
}
