import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/viewmodel/provider/home/home_controller.dart';

class QuizHistory extends StatefulWidget {
  const QuizHistory({super.key});

  @override
  State<QuizHistory> createState() => _QuizHistoryState();
}

class _QuizHistoryState extends State<QuizHistory> {
  late List<QuestionSummaryModel> summaryModel;

  @override
  void initState() {
    super.initState();

    summaryModel =
        Provider.of<HomeController>(context, listen: false).fetchQuizSummary();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz History"),
      ),
      body: summaryModel.isEmpty
          ? const Center(
              child: Text("No history"),
            )
          : ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: summaryModel.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = summaryModel[index];
                return Card(
                  child: ListTile(
                    leading:
                        Icon(Icons.history, color: theme.colorScheme.primary),
                    title: Text("Quiz ${index + 1}"),
                    subtitle:
                        Text("Score: ${data.quizPoint.toInt()}"), // Dummy score
                  ),
                );
              },
            ),
    );
  }
}
