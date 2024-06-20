import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bmi_provider.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your BMI: ${bmiProvider.bmi.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Category: ${bmiProvider.category}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
