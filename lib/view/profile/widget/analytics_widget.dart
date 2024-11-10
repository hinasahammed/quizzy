import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/view/profile/widget/category.dart';
import 'package:quizzy/view/profile/widget/stat_card.dart';
import 'package:quizzy/viewmodel/provider/home/home_controller.dart';

class AnalyticsWidget extends StatefulWidget {
  const AnalyticsWidget({super.key});

  @override
  State<AnalyticsWidget> createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  late List<QuestionSummaryModel> summaryModel;

  @override
  void initState() {
    super.initState();
    summaryModel =
        Provider.of<HomeController>(context, listen: false).fetchQuizSummary();
  }

  @override
  Widget build(BuildContext context) {
    var lastAnswered =
        summaryModel.isNotEmpty ? summaryModel.last.answeredCount : 0;
    var skipped = summaryModel.isNotEmpty ? summaryModel.last.skippedCount : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const StatCard(
                    title: "Total Questions",
                    count: "50",
                    color: Colors.blue,
                  ),
                  StatCard(
                    title: "Answered",
                    count: lastAnswered.toString(),
                    color: Colors.green,
                  ),
                  StatCard(
                    title: "Skipped",
                    count: skipped.toString(),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: 400,
              child: Category(
                answered: lastAnswered.toDouble(),
                skipped: skipped.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
