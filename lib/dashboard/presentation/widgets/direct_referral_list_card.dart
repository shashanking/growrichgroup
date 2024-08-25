import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/core/routes/app_router.gr.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';
import 'package:growrichgroup_dashboard/login/domain/deposit_model.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

class DirectReferralListCard extends ConsumerStatefulWidget {
  const DirectReferralListCard({super.key});

  @override
  ConsumerState<DirectReferralListCard> createState() =>
      _DirectReferralListCardState();
}

class _DirectReferralListCardState
    extends ConsumerState<DirectReferralListCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      final stateNotifier = ref.read(dashbaordProvider.notifier);
      await stateNotifier.getUser();
      await stateNotifier.fetchReferredUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dasboardState = ref.watch(dashbaordProvider);
    final dashboardNotifier = ref.watch(dashbaordProvider.notifier);

    List<UserModel> sortedReferredList =
        List.from(dasboardState.referredUsersList);

    sortedReferredList.sort(
        (a, b) => b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0);

    return Card(
      color: Colors.white.withOpacity(0.2),
      child: Container(
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
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Deposit Amount',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Members under',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Created Date',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Team business',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Verification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Add more fields as needed
                ],
              ),
              const Divider(),
              Column(
                children: sortedReferredList.isEmpty
                    ? [
                        const Text('No referrals found',
                            style: TextStyle(color: Colors.white))
                      ]
                    : sortedReferredList
                        .map(
                          (user) => FutureBuilder<DepositModel?>(
                            future: dashboardNotifier
                                .fetchDepositById(user.depositId.last),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox.shrink();
                              } else if (snapshot.hasError) {
                                return const Text(
                                  'Error loading deposit data',
                                  style: TextStyle(color: Colors.white),
                                );
                              } else if (!snapshot.hasData ||
                                  snapshot.data == null) {
                                return const Text(
                                  'No deposit found',
                                  style: TextStyle(color: Colors.white),
                                );
                              } else {
                                final deposit = snapshot.data!;
                                return FutureBuilder<double>(
                                  future: dashboardNotifier
                                      .calculateTotalDepositAmount(
                                          user.referredIds),
                                  builder: (context, totalSnapshot) {
                                    if (totalSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const SizedBox.shrink();
                                    } else if (totalSnapshot.hasError) {
                                      return const Text(
                                        'Error loading total deposit',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    } else if (!totalSnapshot.hasData) {
                                      // final sortedList = deposit;
                                      return const Text(
                                        'N/A',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    } else {
                                      final totalDeposit = totalSnapshot.data!;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (user.referredIds?.isEmpty ??
                                                  false) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Member have no referrals.');
                                              } else {
                                                AutoRouter.of(context)
                                                    .push(ReferralListRoute(
                                                  depositId:
                                                      user.depositId.last,
                                                  userId: user.id,
                                                ));
                                              }
                                            },
                                            child: IgnorePointer(
                                              child: _buildReferralRow(
                                                  user,
                                                  deposit.depositAmount,
                                                  deposit.createdAt,
                                                  totalDeposit),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          )
                                        ],
                                      );
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReferralRow(UserModel user, String depositAmount,
      DateTime? createdAt, double totalDeposit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100, // Set a fixed width to each cell
          child: SelectableText(
            user.id,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 150,
          child: SelectableText(
            user.username,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 150,
          child: SelectableText(
            '₹ $depositAmount',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 150,
          child: SelectableText(
            '${user.referredIds?.length}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 150,
          child: SelectableText(
            createdAt != null
                ? '${createdAt.day}/${createdAt.month}/${createdAt.year}'
                : 'N/A',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 150,
          child: SelectableText(
            '₹ ${totalDeposit.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 150,
          child: SelectableText(
            user.isVerified ? 'Verified' : user.temporaryPassword,
            style:
                TextStyle(color: user.isVerified ? Colors.green : Colors.red),
          ),
        ),
      ],
    );
  }
}
