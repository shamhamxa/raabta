import 'package:flutter/material.dart';

class OffenseList extends StatelessWidget {
  const OffenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Offense List'),
      ),
    );
  }
}
