import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bmi_provider.dart';

class BmiInputForm extends StatefulWidget {
  const BmiInputForm({super.key});

  @override
  _BmiInputFormState createState() => _BmiInputFormState();
}

class _BmiInputFormState extends State<BmiInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  bool _isMetric = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (${_isMetric ? 'cm' : 'inches'})',
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(16.0),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your height';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (${_isMetric ? 'kg' : 'lbs'})',
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(16.0),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your weight';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Metric', style: TextStyle(fontSize: 16.0)),
                Switch(
                  value: _isMetric,
                  onChanged: (value) {
                    setState(() {
                      _isMetric = value;
                    });
                  },
                ),
                const Text('Imperial', style: TextStyle(fontSize: 16.0)),
              ],
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    double height = double.parse(_heightController.text);
                    double weight = double.parse(_weightController.text);
                    Provider.of<BmiProvider>(context, listen: false)
                        .calculateBmi(height, weight, _isMetric);
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Calculate BMI'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
