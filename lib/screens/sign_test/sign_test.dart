import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SignTest extends StatefulWidget {
  const SignTest({super.key});

  @override
  State<SignTest> createState() => _SignTestState();
}

double percent = 0;
bool isShow = false;

class _SignTestState extends State<SignTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !isShow
              ? Center(
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 15,
                    backgroundColor: Colors.deepPurple.shade100,
                    progressColor: Colors.deepPurple,
                    percent: percent.clamp(0.0, 1.0),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text('${(percent * 100).toStringAsFixed(0)} %'),
                  ),
                )
              : const Text('Completed'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (percent < 1) {
                    percent = percent + 0.05;
                  } else {
                    isShow = true;
                  }
                });
              },
              child: const Text('click'))
        ],
      ),
    );
  }
}
