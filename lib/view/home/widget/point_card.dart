import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/gen/assets.gen.dart';

class PointCard extends StatelessWidget {
  const PointCard({super.key, required this.quizesTaken, required this.total});
  final String quizesTaken;
  final String total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                    quizesTaken,
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
                    "Total\nPoints",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "$total pt",
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
    );
  }
}
