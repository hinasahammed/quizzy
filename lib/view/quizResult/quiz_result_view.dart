import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/gen/assets.gen.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';
import 'package:quizzy/view/bottomNavigation/custom_bottom_navigation.dart';
import 'package:quizzy/view/profile/widget/category.dart';
import 'package:quizzy/view/profile/widget/stat_card.dart';

class QuizResultView extends StatefulWidget {
  const QuizResultView({super.key, required this.questionSummaryModel});
  final QuestionSummaryModel questionSummaryModel;

  @override
  State<QuizResultView> createState() => _QuizResultViewState();
}

class _QuizResultViewState extends State<QuizResultView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String answeredCount = widget.questionSummaryModel.answeredCount.toString();
    String skippedCount = widget.questionSummaryModel.skippedCount.toString();
    String quizPoint = widget.questionSummaryModel.quizPoint.toString();
    String correctAnswers =
        widget.questionSummaryModel.correctAnswersCount.toString();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You answered $correctAnswers out of ${questions.length} questions correctly!",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
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
                    count: answeredCount,
                    color: Colors.green,
                  ),
                  StatCard(
                    title: "Skipped",
                    count: skippedCount,
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
            SizedBox(
              height: 250,
              child: Category(
                answered: double.parse(answeredCount),
                skipped: double.parse(skippedCount),
              ),
            ),
            const Gap(20),
            Text(
              "Your Score",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(10),
            Card(
              child: ListTile(
                leading: Assets.icons.pointIcon.image(width: 40),
                title: Text(quizPoint),
              ),
            ),
            const Gap(40),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomBottomNavigation(),
                      ));
                },
                btnText: "Back to home",
              ),
            ),
            const Gap(40),
          ],
        ),
      )),
    );
  }
}
