import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/add_member/presentation/add_member_page.dart';
import 'package:growrichgroup_dashboard/dashboard/presentation/pages/dashboard_page.dart';
import 'package:growrichgroup_dashboard/base/presentation/side_navidation.dart';

import '../shared/providers.dart';

@RoutePage()
class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => BasePageState();
}

class BasePageState extends ConsumerState<BasePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseNotifierProvider);

    return Scaffold(
      drawer: SideNavigation(),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                widgetView(state.bottomNavIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetView(int index) {
    switch (index) {
      case 0:
        return DashboardPage();
      case 1:
        return AddMemberPage();
      default:
        return Container();
    }
  }
}
