import 'package:flutter/material.dart';
import '../widgets/bmi_input_form.dart';
import '../widgets/bmi_result.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          IconButton(
            icon: const Icon(Icons.track_changes),
            onPressed: () {
              Navigator.pushNamed(context, '/goal');
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BmiInputForm(),
              BmiResult(),
            ],
          ),
        ),
      ),
    );
  }
}
