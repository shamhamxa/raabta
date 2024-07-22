import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/webview/website.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screenwidth(context) * 0.6,
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
                if (mounted) {
                  context.read<UIcontroller>().changeindex(0);
                  Navigator.of(context).pushReplacementNamed(AppRouter.home);
                }
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
                      return SizedBox(
                        width: screenwidth(context) * 0.3,
                        child: AlertDialog(
                          surfaceTintColor: Colors.green,
                          content: SizedBox(
                            height: screenheight(context) * 0.42,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Call 24/7',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'Traffic Updates Via SMS : Send PT to ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: '8583',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 30, sigmaY: 30),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                          child: ListTile(
                                            leading: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              child: Image.asset(
                                                'assets/images/telephone.png',
                                                height: 25,
                                                color: Colors.white,
                                              ),
                                            ),
                                            title: const Text(
                                                "DIG TRAFFIC POLICE"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white.withOpacity(0.7),
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            child: Image.asset(
                                              'assets/images/telephone.png',
                                              height: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          title: const Text("HELP LINE"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white)),
                                            padding: const EdgeInsets.all(12),
                                            child: Image.asset(
                                              'assets/images/youtube.png',
                                              height: 30,
                                            )),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white)),
                                            padding: const EdgeInsets.all(12),
                                            child: Image.asset(
                                              'assets/images/twitter.png',
                                              height: 30,
                                            )),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white)),
                                            padding: const EdgeInsets.all(12),
                                            child: Image.asset(
                                              'assets/images/facebook.png',
                                              height: 30,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              leading: Image.asset(
                'assets/images/telephone.png',
                height: 25,
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
