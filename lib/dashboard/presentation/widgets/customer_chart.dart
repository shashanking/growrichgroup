// lib/presentation/widgets/customers_chart.dart
import 'package:flutter/material.dart';

class CustomersChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Customers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            // Placeholder for the chart, replace this with your actual chart widget
            Container(
              height: 150,
              color: Colors.indigo[700],
              child: Center(
                child: Text(
                  'Bar Chart Placeholder',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
