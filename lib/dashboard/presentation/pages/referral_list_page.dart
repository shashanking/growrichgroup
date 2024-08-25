import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/core/routes/app_router.gr.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';
import 'package:growrichgroup_dashboard/login/domain/deposit_model.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

@RoutePage()
class ReferralListPage extends ConsumerWidget {
  final String userId;
  final String depositId;

  const ReferralListPage({
    Key? key,
    required this.userId,
    required this.depositId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardNotifier = ref.watch(dashbaordProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral List'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: dashboardNotifier.fetchReferredUsersById(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading referred users'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No referrals found'),
            );
          } else {
            final referredList = snapshot.data!;
            return _buildReferralList(context, ref, referredList);
          }
        },
      ),
    );
  }

  Widget _buildReferralList(
      BuildContext context, WidgetRef ref, List<UserModel> referredList) {
    final dashboardNotifier = ref.watch(dashbaordProvider.notifier);

    referredList.sort(
        (a, b) => b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0);

    return ListView.builder(
      itemCount: referredList.length,
      itemBuilder: (context, index) {
        final user = referredList[index];

        return FutureBuilder<DepositModel?>(
          future: dashboardNotifier.fetchDepositById(user.depositId.last),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox.shrink();
            } else if (snapshot.hasError) {
              return const ListTile(
                title: Text('Error loading deposit data'),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const ListTile(
                title: Text('No deposit found'),
              );
            } else {
              final deposit = snapshot.data!;
              return FutureBuilder<double>(
                future: dashboardNotifier
                    .calculateTotalDepositAmount(user.referredIds),
                builder: (context, totalSnapshot) {
                  if (totalSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const SizedBox.shrink();
                  } else if (totalSnapshot.hasError) {
                    return const ListTile(
                      title: Text('Error loading total deposit'),
                    );
                  } else if (!totalSnapshot.hasData) {
                    return const ListTile(
                      title: Text('N/A'),
                    );
                  } else {
                    final totalDeposit = totalSnapshot.data!;
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: ListTile(
                        title: Text(user.username,
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(
                            'Deposit: ₹ ${deposit.depositAmount}, Members under: ${user.referredIds?.length ?? 0}, Team Business: ₹ ${totalDeposit.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.white70)),
                        trailing:
                            Icon(Icons.arrow_forward, color: Colors.white),
                        tileColor: Colors.black87,
                        onTap: () {
                          if (user.referredIds?.isEmpty ?? true) {
                            Fluttertoast.showToast(
                              msg: 'User has no referrals.',
                            );
                          } else {
                            AutoRouter.of(context).push(
                              ReferralListRoute(
                                userId: user.id,
                                depositId: deposit.id,
                              ),
                            );
                          }
                        },
                      ),
                    );
                  }
                },
              );
            }
          },
        );
      },
    );
  }
}
