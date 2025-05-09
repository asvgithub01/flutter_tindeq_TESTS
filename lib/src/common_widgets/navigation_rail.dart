import 'package:flutter/material.dart';
import 'package:flutter_tindeq/src/constants/app_sizes.dart';
import 'package:flutter_tindeq/src/constants/theme.dart';
import 'package:flutter_tindeq/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tindeq/src/localization/string_hardcoded.dart';

import '../../main.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({super.key});

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  final NavigationRailLabelType labelType = NavigationRailLabelType.all;

  int _selectedIndex = 0;
  final bool showLeading = false;
  final bool showTrailing = false;
  final double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: backColor,
      selectedIndex: _selectedIndex,
      groupAlignment: groupAlignment,
      unselectedLabelTextStyle: TextStyles.unselectedText,
      selectedLabelTextStyle: TextStyles.selectedText,
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            context.goNamed(AppRoute.user.name);
          case 1:
            context.goNamed(AppRoute.maxTest.name);
          case 2:
            context.goNamed(AppRoute.rfdTest.name);
          case 3:
            context.goNamed(AppRoute.cftTest.name);
          case 4:
            context.goNamed(AppRoute.analysisResults.name);
        }
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: labelType,
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          // icon: Icon(Icons.person_2_outlined),
          icon: const Icon(Icons.person),
          selectedIcon: const Icon(Icons.person),
          label: Text('User Details'.hardcoded,
              style: const TextStyle(fontSize: Sizes.medium)),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.timeline),
          selectedIcon: const Icon(Icons.timeline),
          label: Text('Max Test'.hardcoded,
              style: const TextStyle(fontSize: Sizes.medium)),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.trending_up),
          selectedIcon: const Icon(Icons.trending_up),
          label: Text('RFD Test'.hardcoded,
              style: const TextStyle(fontSize: Sizes.medium)),
        ),
        NavigationRailDestination(
          icon: Transform.scale(
            scaleX: -1,
            child: const Icon(Icons.signal_cellular_alt),
          ),
          selectedIcon: Transform.scale(
            scaleX: -1,
            child: const Icon(Icons.signal_cellular_alt),
          ),
          label: Text('CFT Test'.hardcoded,
              style: const TextStyle(fontSize: Sizes.medium)),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.trending_up),
          selectedIcon: const Icon(Icons.trending_up),
          label: Text('Analysis Results'.hardcoded,
              style: const TextStyle(fontSize: Sizes.medium)),
        ),
      ],
    );
  }
}
