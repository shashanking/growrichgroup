import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GlobalIncomeCard extends ConsumerStatefulWidget {
  @override
  ConsumerState<GlobalIncomeCard> createState() => _GlobalIncomeCardState();
}

class _GlobalIncomeCardState extends ConsumerState<GlobalIncomeCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      final stateNotifier = ref.read(dashbaordProvider.notifier);
      await stateNotifier.getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(dashbaordProvider.notifier);

    return FutureBuilder<Map<String, dynamic>>(
      future: stateNotifier.checkUserGlobalLevel(),
      builder: (context, snapshot) {
        Widget content;

        if (snapshot.connectionState == ConnectionState.waiting) {
          content = Center(child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          content = Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          final currentLevel = data['currentLevel'] ?? 'N/A';
          final nextLevel = data['nextLevel'] ?? 'N/A';
          final amountToNextLevel = data['amountNeeded']?.toString() ?? 'N/A';

          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Level: $currentLevel',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Next Level: $nextLevel',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Amount Needed: ₹ ${amountToNextLevel}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          );
        } else {
          content = Center(
            child: const Text(
              'No data available',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        return Card(
          color: Colors.indigo[900],
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            // height: 10.h,
            width: Device.screenType == ScreenType.mobile ? 85.w : 20.w,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Global Income',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 150,
                  padding: const EdgeInsets.only(top: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.indigo[800],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(child: content),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
