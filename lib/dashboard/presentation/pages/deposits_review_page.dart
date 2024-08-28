import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';

@RoutePage()
class DepositsReviewPage extends ConsumerStatefulWidget {
  const DepositsReviewPage({super.key});

  @override
  ConsumerState<DepositsReviewPage> createState() => _DepositsReviewPageState();
}

class _DepositsReviewPageState extends ConsumerState<DepositsReviewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      final stateNotifier = ref.read(dashboardProvider.notifier);
      await stateNotifier.fetchUnverifiedDeposits();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(dashboardProvider.notifier);
    final state = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Unverified TopUps List'),
      ),
      body: Card(
        color: Colors.white.withOpacity(0.2),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'ID',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Username',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // SizedBox(
                    //   width: 150,
                    //   child: Text(
                    //     'PAN Card',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Deposited Date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Balance before',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Deposit Amount',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        'Approve',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        'Reject',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  children: state.unverifiedDeposits.map((deposit) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 50), // You can add index or icon
                        SizedBox(
                          width: 100,
                          child: Text(
                            deposit.id,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            deposit.depositorName,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                        SizedBox(
                          width: 150,
                          child: Text(
                            deposit.createdAt?.toLocal().toString() ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            deposit.depositAmount,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            deposit.topUps
                                    ?.firstWhere(
                                      (topUp) => !topUp.isVerified,
                                    )
                                    .topupAmount ??
                                '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                stateNotifier.approveTopUp(deposit);
                              },
                              child: const Text('Approve'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                stateNotifier.rejectTopUp(deposit);
                              },
                              child: const Text('Reject'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
