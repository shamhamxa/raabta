import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/score.dart';
import 'package:raabta/widgets/app_button.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Scores'),
      ),
      body: Stack(
        children: [
          Consumer<TotalScore>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.scoresList.length,
                itemBuilder: (context, index) {
                  final eachScore = value.scoresList[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      title: Text(eachScore.toString()),
                    ),
                  );
                },
              );
            },
          ),
          Align(
            alignment: const Alignment(0, 0.75),
            child: AppButton(
              color: Theme.of(context).colorScheme.primary,
              isEnable: true,
              ontap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('Are You Sure ?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel '),
                          ),
                          TextButton(
                              onPressed: () {
                                Provider.of<TotalScore>(context, listen: false)
                                    .removeScoreList();
                                Navigator.pop(context);
                              },
                              child: const Text('Yes Do '))
                        ],
                      );
                    });
              },
              text: 'Clear',
            ),
          )
        ],
      ),
    );
  }
}
