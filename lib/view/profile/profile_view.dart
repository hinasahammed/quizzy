
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/model/user/user_model.dart';
import 'package:quizzy/utils/utils.dart';
import 'package:quizzy/view/profile/widget/analytics_widget.dart';
import 'package:quizzy/view/profile/widget/item_card.dart';
import 'package:quizzy/view/profile/widget/quiz_history.dart';
import 'package:quizzy/viewmodel/provider/profile/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late UserModel user;
  @override
  void initState() {
    super.initState();
    user =
        Provider.of<ProfileController>(context, listen: false).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profileProvider =
        Provider.of<ProfileController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.userName,
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              "+91${user.mobileNumber}",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
              ),
            ),
            const Gap(20),
            ItemCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnalyticsWidget(),
                    ));
              },
              itemName: "Last Summary",
              icon: Icons.analytics,
            ),
            ItemCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizHistory(),
                    ));
              },
              itemName: "Quiz History",
              icon: Icons.history,
            ),
            const Spacer(),
            ItemCard(
              onTap: () {
                Utils.showAwesomeDialog(
                  context,
                  DialogType.question,
                  () {
                    profileProvider.logout(context);
                  },
                );
              },
              itemName: "Logout",
              icon: Icons.logout,
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
