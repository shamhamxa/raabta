import 'package:flutter/material.dart';
import 'package:raabta/routes/route.dart';
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
                      return AlertDialog.adaptive(
                        content: const Text(
                          'Call 24/7',
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
