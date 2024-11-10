import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/view/profile/profile_view.dart';
import 'package:quizzy/view/home/home_view.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: theme.colorScheme.primary,
        backgroundColor: Colors.transparent,
        index: _bottomIndex,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_filled,
              color: theme.colorScheme.onPrimary,
              size: 30,
            ),
            label: 'Home',
            labelStyle: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
              size: 30,
            ),
            label: 'Profile',
            labelStyle: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _bottomIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _bottomIndex,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
    );
  }
}
