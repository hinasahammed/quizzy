import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/gen/assets.gen.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/model/user/user_model.dart';
import 'package:quizzy/view/home/widget/last_score_card.dart';
import 'package:quizzy/view/home/widget/point_card.dart';
import 'package:quizzy/view/home/widget/start_quiz_card.dart';
import 'package:quizzy/viewmodel/provider/home/home_controller.dart';
import 'package:quizzy/viewmodel/provider/profile/profile_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<QuestionSummaryModel> summaryModel;
  late UserModel user;
  @override
  void initState() {
    super.initState();
    user =
        Provider.of<ProfileController>(context, listen: false).getCurrentUser();
    summaryModel =
        Provider.of<HomeController>(context, listen: false).fetchQuizSummary();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double total = 0.0;

    var lastScore = summaryModel.isNotEmpty
        ? double.parse(summaryModel.last.quizPoint.toString()).toInt()
        : 0;
    var quizesTaken = summaryModel.length;

    for (var i = 0; i < summaryModel.length; i++) {
      total += double.parse(summaryModel[i].quizPoint.toString());
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👋 Hi ${user.userName},",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                "Great to see you again",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Gap(20),
              Card(
                clipBehavior: Clip.hardEdge,
                child: Assets.images.quizBannerBlue.image(),
              ),
              const Gap(20),
              PointCard(
                quizesTaken: quizesTaken.toString(),
                total: total.toInt().toString(),
              ),
              const Gap(20),
              const StartQuizCard(),
              const Gap(20),
              Text(
                "Last score",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Gap(10),
              LastScoreCard(
                lastScore: lastScore.toString(),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
