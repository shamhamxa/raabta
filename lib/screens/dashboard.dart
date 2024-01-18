import 'package:flutter/material.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/widgets/dashboard_widgets/dashboard_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'R A A B T A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              DashboardCard(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.offense);
                  },
                  textColor: const Color.fromARGB(255, 24, 110, 180),
                  color: Colors.blue.shade50,
                  image: 'assets/images/list.png',
                  text: 'Offense List'),
              DashboardCard(
                onTap: () {},
                imagecolors: const Color.fromARGB(255, 197, 120, 4),
                color: Colors.orange.shade50,
                image: 'assets/images/id-card.png',
                text: 'Traffic Sign Test',
                textColor: const Color.fromARGB(255, 197, 120, 4),
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                onTap: () {},
                imagecolors: Colors.red,
                color: Colors.red.shade100,
                image: 'assets/images/id-card.png',
                text: 'Traffic Education',
                textColor: const Color.fromARGB(255, 162, 44, 35),
              ),
              DashboardCard(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.liscense);
                },
                imagecolors: const Color.fromARGB(255, 162, 176, 33),
                color: Colors.yellow.shade50,
                image: 'assets/images/id-card.png',
                text: 'Liscense Procedure',
                textColor: const Color.fromARGB(255, 131, 142, 36),
              ),
            ],
          ),
          Row(
            children: [
              DashboardCard(
                onTap: () {},
                imagecolors: const Color.fromARGB(255, 64, 149, 67),
                color: Colors.green.shade100,
                image: 'assets/images/id-card.png',
                text: 'Traffic Status',
                textColor: const Color.fromARGB(255, 55, 139, 58),
              ),
              DashboardCard(
                onTap: () {},
                imagecolors: Colors.blueGrey,
                color: Colors.blueGrey.shade100,
                image: 'assets/images/id-card.png',
                text: 'Live Radio',
                textColor: const Color.fromARGB(255, 100, 124, 136),
              ),
            ],
          )
        ],
      ),
    );
  }
}
