import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/bmi_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: bmiProvider.history.isEmpty
            ? const Center(
          child: Text(
            'No history available',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
        )
            : ListView.separated(
          itemCount: bmiProvider.history.length,
          separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
          itemBuilder: (context, index) {
            final record = bmiProvider.history[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              title: Text(
                'BMI: ${record.bmi.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Category: ${record.category}', style: const TextStyle(fontSize: 16.0)),
              trailing: Text(
                DateFormat('yyyy-MM-dd – kk:mm').format(record.date),
                style: const TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
