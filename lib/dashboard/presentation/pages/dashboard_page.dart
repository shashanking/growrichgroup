import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/base/presentation/side_navidation.dart';
import 'package:growrichgroup_dashboard/core/constants/app_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/provider.dart';
import '../widgets/overview_card.dart';
import '../widgets/direct_referral_list_card.dart';
import '../widgets/aquisition_charts.dart';
import '../widgets/customer_chart.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      final stateNotifier = ref.read(dashboardProvider.notifier);
      await stateNotifier.getUser();
      await stateNotifier.checkUserVerification();
    });
    super.initState();
  }

  int getLevel(int length) {
    if (length <= 1) {
      return 2;
    } else if (length == 2) {
      return 5;
    } else if (length == 3) {
      return 10;
    } else if (length >= 4) {
      return 20;
    } else {
      return 0; // Does not meet the condition
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(dashboardProvider.notifier);
    final state = ref.watch(dashboardProvider);
    bool isMobile = Device.screenType == ScreenType.mobile;

    final int level = getLevel(state.user?.referredIds?.length ?? 0);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black87,
          drawer: isMobile ? SideNavigation() : null,
          appBar: isMobile
              ? AppBar(
                  title: const Text('Dashboard'),
                  backgroundColor: Colors.black87,
                )
              : null,
          body: isMobile
              ? SingleChildScrollView(
                  child: Container(
                    width: 100.w,
                    // height: 100.h,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (state.uid == AppConstants.adminId)
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showConfirmationDialog(context, () async {
                                      await stateNotifier
                                          .triggerBiWeeklyInterest();
                                    });
                                  },
                                  child:
                                      const Text('Trigger Uni-Level Interest'),
                                ),
                              )
                          ],
                        ),
                        const Text(
                          'Overview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OverviewCard(
                              title: 'Self Investment',
                              value: '₹ ${state.depositAmount}',
                              percentage: '',
                              color: Colors.pinkAccent,
                            ),
                            OverviewCard(
                              title: 'Direct Referral Income',
                              value: '₹ ${state.totalDRIncome}',
                              percentage:
                                  'from ${state.noOfIncome} direct referrals',
                              color: Colors.purpleAccent,
                            ),
                            OverviewCard(
                              title: 'Non Working Income',
                              value: '₹ ${state.totalNWIncome}',
                              percentage: '',
                              color: Colors.yellowAccent,
                            ),
                            OverviewCard(
                              title: 'Uni Level Income',
                              value: '₹ ${state.totalULIncome}',
                              percentage: '',
                              color: Colors.yellowAccent,
                            ),
                            OverviewCard(
                              title: 'Team',
                              value: '${state.teamSum}',
                              percentage:
                                  '${state.user?.referredIds?.length ?? 0} direct referrals',
                              color: Colors.greenAccent,
                            ),
                            OverviewCard(
                              title: 'Team Business',
                              value: '₹ ${state.teamIncome}',
                              percentage: '',
                              color: Colors.yellowAccent,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Direct Referrals',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const DirectReferralListCard(),
                        const SizedBox(height: 16),
                        GlobalIncomeCard(),
                        // const SizedBox(height: 16),
                        // GlobalRewardCard(),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Row(
                    children: [
                      SideNavigation(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.uid == AppConstants.adminId)
                                ElevatedButton(
                                  onPressed: () {
                                    _showConfirmationDialog(context, () async {
                                      await stateNotifier
                                          .triggerBiWeeklyInterest();
                                    });
                                  },
                                  child:
                                      const Text('Trigger Uni-Level Interest'),
                                ),
                              const Text(
                                'Overview',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                direction: Axis.horizontal,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  OverviewCard(
                                    title: 'Self Investment',
                                    value: '₹ ${state.depositAmount}',
                                    percentage: '',
                                    color: Colors.pinkAccent,
                                  ),
                                  OverviewCard(
                                    title: 'Direct Referral Income',
                                    value: '₹ ${state.totalDRIncome}',
                                    percentage:
                                        'from ${state.noOfIncome} direct referrals',
                                    color: Colors.purpleAccent,
                                  ),
                                  OverviewCard(
                                    title: 'Non Working Income',
                                    value: '₹ ${state.totalNWIncome}',
                                    percentage: '',
                                    color: Colors.yellowAccent,
                                  ),
                                  OverviewCard(
                                    title: 'Uni Level Income',
                                    value: '₹ ${state.totalULIncome}',
                                    percentage: '',
                                    color: Colors.yellowAccent,
                                  ),
                                  OverviewCard(
                                    title: 'Team',
                                    value: '${state.teamSum}',
                                    percentage:
                                        '${state.user?.referredIds?.length ?? 0} direct referrals',
                                    color: Colors.greenAccent,
                                  ),
                                  OverviewCard(
                                    title: 'Team Business',
                                    value: '₹ ${state.teamIncome}',
                                    percentage: '',
                                    color: Colors.yellowAccent,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Direct Referrals',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Flexible(
                                              child: DirectReferralListCard()),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      children: [
                                        GlobalIncomeCard(),
                                        // const SizedBox(height: 16),
                                        // GlobalRewardCard(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        if (state.isLoading)
          Container(
            height: 100.h,
            width: 100.w,
            color: Colors.black.withOpacity(0.7),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

void _showConfirmationDialog(BuildContext context, VoidCallback callback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Action'),
        content: const Text(
          'This will trigger two incomes:\n'
          '1. Non-working income for all\n'
          '2. Uni-level income for all\n'
          'Do you want to proceed?',
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // write a function to trigger a non-working income
              // & uni-level income for their referral chain of each user
              callback.call();
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
