import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/base/shared/providers.dart';
import 'package:growrichgroup_dashboard/core/routes/app_router.gr.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';

class SideNavigation extends ConsumerWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardProvider);
    final stateNotifier = ref.read(baseNotifierProvider.notifier);

    return Container(
      width: 200,
      color: Colors.black87, // Updated background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Spacing from top
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Image.asset(
              'assets/images/grg.png',
              scale: 2,
            ),
          ),
          // Adds a divider line
          if (dashboardState.isAdmin) ...[
            ListTile(
              leading: const Icon(Icons.monetization_on, color: Colors.white),
              title: const Text('Check Deposits',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                AutoRouter.of(context).push(const DepositsReviewRoute());
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
          ],
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.white),
            title:
                const Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {
              stateNotifier.tapBottomNavIndex(0);
              if (!kIsWeb) Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add, color: Colors.white),
            title:
                const Text('Add Member', style: TextStyle(color: Colors.white)),
            onTap: () {
              stateNotifier.tapBottomNavIndex(1);
              context.router.push(const AddMemberRoute()); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.money_sharp, color: Colors.white),
            title: const Text('Deposit', style: TextStyle(color: Colors.white)),
            onTap: () async {
              await context.maybePop();
              stateNotifier.tapBottomNavIndex(2);

              await context.router
                  .push(DepositRoute(userId: dashboardState.uid));
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.person_add, color: Colors.white),
          //   title: const Text('Income', style: TextStyle(color: Colors.white)),
          //   onTap: () {
          //     // stateNotifier.tapBottomNavIndex(1);
          //     // context.router.push(AddMemberRoute()); // Close the drawer
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              stateNotifier.logout();
              context.router.replaceAll(const [LoginRoute()]);
            },
          ),
          const Spacer(), // Pushes the rest to the bottom
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.white54),
            title: const Text('Help', style: TextStyle(color: Colors.white54)),
            onTap: () {
              // Navigate to help or documentation
            },
          ),
        ],
      ),
    );
  }
}
