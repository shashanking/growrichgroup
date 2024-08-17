import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:growrichgroup_dashboard/base/presentation/side_navidation.dart';
import '../widgets/overview_card.dart';
import '../widgets/top_selling_products.dart';
import '../widgets/aquisition_charts.dart';
import '../widgets/customer_chart.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 600) SideNavigation(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OverviewCard(
                        title: 'Deposit',
                        value: '₹27,012',
                        percentage: '+2% than last week',
                        color: Colors.pinkAccent,
                      ),
                      OverviewCard(
                        title: 'ROI',
                        value: '5,661',
                        percentage: '+3.21% than last month',
                        color: Colors.purpleAccent,
                      ),
                      OverviewCard(
                        title: 'Members',
                        value: '15,138',
                        percentage: '28 Referred Members',
                        color: Colors.greenAccent,
                      ),
                      OverviewCard(
                        title: 'Non Woking Income',
                        value: '19.56%',
                        percentage: '-4.87% than last week',
                        color: Colors.yellowAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(width: 16),
                        Column(
                          children: [
                            GlobalIncomeCard(),
                            SizedBox(height: 16),
                            GlobalRewardCard(),
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
    );
  }
}
