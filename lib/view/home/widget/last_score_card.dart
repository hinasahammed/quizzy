import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/gen/assets.gen.dart';

class LastScoreCard extends StatelessWidget {
  const LastScoreCard({super.key, required this.lastScore});
  final String lastScore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Row(
          children: [
            Assets.icons.pointIcon.image(width: 30),
            const Gap(10),
            Text(
              "$lastScore pt",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
