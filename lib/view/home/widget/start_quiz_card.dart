import 'package:flutter/material.dart';
import 'package:quizzy/view/quiz/quiz_view.dart';

class StartQuizCard extends StatelessWidget {
  const StartQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizView(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start quiz",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "50 Questions",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_circle_right,
                    size: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
