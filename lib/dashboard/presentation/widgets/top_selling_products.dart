// lib/presentation/widgets/top_selling_products.dart
import 'package:flutter/material.dart';

class TopSellingProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProductRow('Kaushik Ghora', '₹79.49', '1276'),
            Divider(color: Colors.white54),
            _buildProductRow('Binoy Ghosh', '₹26', '4498'),
          ],
        ),
      ),
    );
  }

  Widget _buildProductRow(String name, String price, String quantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          price,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          quantity,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
