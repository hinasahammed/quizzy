import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/gen/assets.gen.dart';
import 'package:quizzy/view/quiz/quiz_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "👋 Hi Your name,",
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
            Card(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Assets.icons.quizzTakenIcon.image(width: 40),
                      const Gap(10),
                      Column(
                        children: [
                          Text(
                            "Quizzes Taken",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "10",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const VerticalDivider(),
                      Assets.icons.pointIcon.image(width: 40),
                      const Gap(10),
                      Column(
                        children: [
                          Text(
                            "Points",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "10",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            Card(
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
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(.6),
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
            ),
            const Gap(20),
            Text(
              "Last score",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(10),
            Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Row(
                  children: [
                    Assets.icons.pointIcon.image(width: 30),
                    const Gap(10),
                    Text(
                      "10 pt",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
