import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:raabta/widgets/app_button.dart';
import 'package:raabta/widgets/test_selection.dart';

class SignTest extends StatefulWidget {
  const SignTest({Key? key}) : super(key: key);

  @override
  State<SignTest> createState() => _SignTestState();
}

bool isShow = false;

class _SignTestState extends State<SignTest> {
  int selectedValue = 0;
  double percent = 0;
  int point = 0;
  int optionPoint = 0;
  bool isEnable = false;
  bool isOptionSelected = false;

  final List questions = [
    'what does this sign mean ?',
    'what is your name ?',
    'who is your brother ?',
  ];
  final List<List<String>> optionsList = [
    ['31', '14', '27', '23'],
    ['John', 'Jane', 'Alice', 'Bob'],
    ['khan', 'kamal', 'jamal', 'jalal'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text('T E S T'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            !isShow
                ? Center(
                    child: CircularPercentIndicator(
                      animateFromLastPercent: true,
                      animationDuration: 300,
                      animation: true,
                      radius: 70,
                      lineWidth: 10,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      progressColor: Theme.of(context).colorScheme.primary,
                      percent: percent.clamp(0.0, 1.0),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text('${(percent * 100).toStringAsFixed(0)} %'),
                    ),
                  )
                : const Center(child: Text('Completed')),
            Column(
              children: [
                Text(questions[point].toString()),
                const SizedBox(
                  height: 10,
                ),
                TestSelection(
                  number: 1,
                  value: selectedValue,
                  onTap: () {
                    setState(() {
                      selectedValue = 1;
                      isEnable = true;
                      isOptionSelected = true;
                    });
                  },
                  alphabet: 'A.',
                  option: optionsList[optionPoint][0],
                ),
                const SizedBox(
                  height: 10,
                ),
                TestSelection(
                  number: 2,
                  value: selectedValue,
                  onTap: () {
                    setState(() {
                      selectedValue = 2;
                      isEnable = true;
                      isOptionSelected = true;
                    });
                  },
                  alphabet: 'B.',
                  option: optionsList[optionPoint][1],
                ),
                const SizedBox(
                  height: 10,
                ),
                TestSelection(
                  number: 3,
                  onTap: () {
                    setState(() {
                      selectedValue = 3;
                      isEnable = true;
                      isOptionSelected = true;
                    });
                  },
                  value: selectedValue,
                  alphabet: 'C.',
                  option: optionsList[optionPoint][2],
                ),
                const SizedBox(
                  height: 10,
                ),
                TestSelection(
                  number: 4,
                  value: selectedValue,
                  onTap: () {
                    setState(() {
                      selectedValue = 4;
                      isEnable = true;
                      isOptionSelected = true;
                    });
                  },
                  alphabet: 'D.',
                  option: optionsList[optionPoint][3],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              isEnable: isOptionSelected,
              ontap: isOptionSelected
                  ? () {
                      setState(() {
                        print(optionsList[optionPoint][selectedValue - 1]);
                        if (percent < 1) {
                          percent = percent + 0.05;
                          selectedValue = 0;
                          point = (point + 1) % questions.length;
                          optionPoint = (optionPoint + 1) % optionsList.length;
                          isOptionSelected = false; // Reset option selection
                        }
                      });
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
