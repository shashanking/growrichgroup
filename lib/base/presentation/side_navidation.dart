import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/base/shared/providers.dart';
import 'package:growrichgroup_dashboard/routes/app_router.gr.dart';

class SideNavigation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);

    return Container(
      width: 200,
      color: Colors.black87, // Updated background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Spacing from top
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Image.asset(
              'assets/images/grg.png',
              scale: 2,
            ),
          ),
          // Adds a divider line
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.white),
            title: Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {
              stateNotifier.tapBottomNavIndex(0);
              if (!kIsWeb) Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add, color: Colors.white),
            title: Text('Add Member', style: TextStyle(color: Colors.white)),
            onTap: () {
              stateNotifier.tapBottomNavIndex(1);
              context.router.push(AddMemberRoute()); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Implement logout functionality
            },
          ),
          Spacer(), // Pushes the rest to the bottom
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.white54),
            title: Text('Help', style: TextStyle(color: Colors.white54)),
            onTap: () {
              // Navigate to help or documentation
            },
          ),
        ],
      ),
    );
  }
}
