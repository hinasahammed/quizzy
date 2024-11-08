import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/view/dashboard/widget/category.dart';
import 'package:quizzy/view/dashboard/widget/quiz_history.dart';
import 'package:quizzy/view/dashboard/widget/stat_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StatCard(
                    title: "Total Questions",
                    count: "50",
                    color: Colors.blue,
                  ),
                  StatCard(
                    title: "Answered",
                    count: "35",
                    color: Colors.green,
                  ),
                  StatCard(
                    title: "Skipped",
                    count: "15",
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const Gap(20),
            Text(
              "Analytics",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(10),
            const SizedBox(
              height: 250,
              child: Category(),
            ),
            const Gap(20),
            Text(
              "Quiz history",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(10),
            const QuizHistory(),
          ],
        ),
      ),
    );
  }
}
