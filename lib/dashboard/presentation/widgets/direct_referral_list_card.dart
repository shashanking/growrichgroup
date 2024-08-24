// lib/presentation/widgets/top_selling_products.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';
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

    return Card(
      color: Colors.white.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: dasboardState.referredUsersList.isEmpty
              ? [
                  Text('No referrals found',
                      style: TextStyle(color: Colors.white))
                ]
              : dasboardState.referredUsersList
                  .map((user) => _buildReferralRow(user))
                  .toList(),
        ),
      ),
    );
  }

  Widget _buildReferralRow(UserModel user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          user.id,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          user.username,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          user.depositId.last,
          style: TextStyle(color: Colors.white),
        ),
        // Add more fields as needed
      ],
    );
  }
}
