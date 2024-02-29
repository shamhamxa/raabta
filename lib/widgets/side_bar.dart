import 'package:flutter/material.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/webview/website.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRouter.home);
              },
              leading: Image.asset(
                'assets/images/home.png',
                height: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Home'),
            ),
            ListTile(
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KPKTraffic()));
              },
              leading: Image.asset(
                'assets/images/world.png',
                height: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('KP Website'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: screenheight(context) * 0.2,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -45,
                                right: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4, color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.green,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Call 24/7'),
                                  const Text(
                                    'Traffic Updates Via SMS : Send PT to 8583',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: screenwidth(context),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            // padding: const EdgeInsets.all(20)
                                            ),
                                        onPressed: () {},
                                        child: const Text('data')),
                                  ),
                                  SizedBox(
                                    width: screenwidth(context),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            // padding: const EdgeInsets.all(20)
                                            ),
                                        onPressed: () {},
                                        child: const Text('data')),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        actions: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.call))
                        ],
                      );
                    });
              },
              leading: Image.asset(
                'assets/images/telephone.png',
                height: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}
