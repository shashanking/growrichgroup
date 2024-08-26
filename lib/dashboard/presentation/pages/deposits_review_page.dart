import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DepositsReviewPage extends ConsumerWidget {
  const DepositsReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Card(
        color: Colors.white.withOpacity(0.2),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(8.0),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    SizedBox(
                      width: 150,
                      child: Text(
                        'PAN Card',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
                        'Deposit Amount',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Approve',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Reject',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Add more fields as needed
                  ],
                ),
                Divider(),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
