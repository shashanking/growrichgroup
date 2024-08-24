import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/base/presentation/side_navidation.dart';
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
      final stateNotifier = ref.read(dashbaordProvider.notifier);
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
    final stateNotifier = ref.read(dashbaordProvider.notifier);
    final state = ref.watch(dashbaordProvider);
    bool isMobile = Device.screenType == ScreenType.mobile;

    final int level = getLevel(state.user?.referredIds?.length ?? 0);
    // final double incomes = totalIncome(state.user!.incomes!) ?? 0;

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
          body: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Row(
                children: [
                  if (!isMobile) SideNavigation(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            direction:
                                !isMobile ? Axis.horizontal : Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OverviewCard(
                                title: 'Deposit',
                                value: '₹ ${state.depositAmount}',
                                percentage: '',
                                color: Colors.pinkAccent,
                              ),
                              OverviewCard(
                                title: 'Direct Referral Income',
                                value: '₹ ${state.totalIncome}',
                                percentage:
                                    'from ${state.noOfIncome} direct referrals',
                                color: Colors.purpleAccent,
                              ),
                              OverviewCard(
                                title: 'Members',
                                value: '${state.user?.referredIds?.length}',
                                percentage: '$level Level Access',
                                color: Colors.greenAccent,
                              ),
                              OverviewCard(
                                title: 'Non Woking Income',
                                value: '₹ 0',
                                percentage: '0% than last week',
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
                                      Expanded(
                                        child: DirectReferralListCard(),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isMobile) ...[
                                  const SizedBox(width: 16),
                                  Column(
                                    children: [
                                      GlobalIncomeCard(),
                                      const SizedBox(height: 16),
                                      GlobalRewardCard(),
                                    ],
                                  ),
                                ]
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
