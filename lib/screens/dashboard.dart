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
      drawer: Drawer(
        backgroundColor: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        content: const Text('kamal'),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('kamal')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('kamal')),
                          )
                        ],
                      );
                    },
                  );
                },
                child: const Text('Button')),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.80,
        child: Column(
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
                  // imagecolors: const Color.fromARGB(255, 197, 120, 4),
                  color: Colors.orange.shade50,
                  image: 'assets/images/checked.png',
                  text: 'Traffic Sign Test',
                  textColor: const Color.fromARGB(255, 197, 120, 4),
                ),
              ],
            ),
            Row(
              children: [
                DashboardCard(
                  onTap: () {},
                  color: Colors.red.shade100,
                  image: 'assets/images/warning.png',
                  text: 'Traffic Education',
                  textColor: const Color.fromARGB(255, 162, 44, 35),
                ),
                DashboardCard(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.liscense);
                  },
                  imagecolors: Colors.teal,
                  color: Colors.teal.shade100,
                  image: 'assets/images/id-card.png',
                  text: 'Liscense Procedure',
                  textColor: Colors.teal,
                ),
              ],
            ),
            Row(
              children: [
                DashboardCard(
                  onTap: () {},
                  color: Colors.green.shade100,
                  image: 'assets/images/traffic-light.png',
                  text: 'Traffic Status',
                  textColor: const Color.fromARGB(255, 55, 139, 58),
                ),
                DashboardCard(
                  imagecolors: const Color.fromARGB(255, 88, 110, 121),
                  onTap: () {},
                  color: Colors.blueGrey.shade100,
                  image: 'assets/images/radio.png',
                  text: 'Live Radio',
                  textColor: const Color.fromARGB(255, 100, 124, 136),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
