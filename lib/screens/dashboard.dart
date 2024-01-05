import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xff2382a1),
        foregroundColor: Colors.white,
      ),
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    // color: Colors.blue.shade100,

                    color: Colors.blue.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/exclamation.png',
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text(
                              'Offense List',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 2, 82, 148)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    color: Colors.orange.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/exclamation.png',
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text('Offense List'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    color: Colors.red.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/exclamation.png',
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text('Offense List'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    color: Colors.yellow.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/exclamation.png',
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text('Offense List'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    color: Colors.green.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/exclamation.png',
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text('Offense List'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    color: Colors.blueGrey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/exclamation.png',
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text('Offense List'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
