// lib/presentation/widgets/overview_card.dart
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color color;

  OverviewCard({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == ScreenType.mobile;
    return Card(
      color: color.withOpacity(0.1),
      child: Container(
        height: 120,
        width: isMobile ? 85.w : 15.w,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              percentage,
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
