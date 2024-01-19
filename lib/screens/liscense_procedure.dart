import 'package:flutter/material.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/widgets/liscense_widgets/liscense_card.dart';

class LiscenseProcedure extends StatelessWidget {
  const LiscenseProcedure({super.key});
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Liscense Procedure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.87,
              child: Column(
                // scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    child: Text(
                      'DRIVING LISCENSE FOR AFGHAN NATIONAL',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      interactive: true,
                      controller: scrollController,
                      trackVisibility: true,
                      child: ListView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(bottom: 10),
                        children: [
                          Row(
                            children: [
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.permit);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 240, 31, 16),
                                  textColor:
                                      const Color.fromARGB(255, 240, 31, 16),
                                  color: Colors.red.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'Learner Permit'),
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.fresh);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 1, 104, 188),
                                  textColor:
                                      const Color.fromARGB(255, 1, 104, 188),
                                  color: Colors.blue.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'Fresh Driving Liscense'),
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.conversion);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 25, 90, 27),
                                  textColor:
                                      const Color.fromARGB(255, 25, 90, 27),
                                  color: Colors.green.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'Conversion Of Driving Liscense'),
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.dublicate);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 2, 127, 115),
                                  textColor:
                                      const Color.fromARGB(255, 2, 98, 88),
                                  color: Colors.teal.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'Dublicate Driving Liscense'),
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.endoresement);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 110, 66, 49),
                                  textColor:
                                      const Color.fromARGB(255, 110, 66, 49),
                                  color: Colors.brown.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'Endoresement Of Driving Liscense'),
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.renewal);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 3, 124, 140),
                                  textColor:
                                      const Color.fromARGB(255, 3, 124, 140),
                                  color: Colors.cyan.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'Renewal Of Expired Driving Liscense'),
                              LiscenseCard(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.international);
                                  },
                                  imageColor:
                                      const Color.fromARGB(255, 154, 28, 176),
                                  textColor:
                                      const Color.fromARGB(255, 154, 28, 176),
                                  color: Colors.purple.shade100,
                                  image: 'assets/images/card.png',
                                  text: 'International Driving Permit'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'DRIVING LISCENSE FOR AFGHAN NATIONAL',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: LiscenseCard(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.afghanlearnerpermit);
                              },
                              imageColor: Colors.indigo,
                              textColor: Colors.indigo,
                              color: Colors.indigo.shade100,
                              image: 'assets/images/card.png',
                              text: 'Learner Permit'),
                        ),
                        Expanded(
                          child: LiscenseCard(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.afghandrivinglicense);
                              },
                              imageColor: Colors.teal,
                              textColor: Colors.teal,
                              color: Colors.teal.shade100,
                              image: 'assets/images/card.png',
                              text: 'Driving Liscense'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        'DRIVING LISCENSE FOR DIPLOMATS AND EMBASSY OFFICERS/OFFICIALS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: LiscenseCard(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.internationalpermit);
                              },
                              imageColor: Colors.purple,
                              textColor: Colors.purple,
                              color: Colors.purple.shade100,
                              image: 'assets/images/card.png',
                              text: 'Learner Permit'),
                        ),
                        Expanded(
                          child: LiscenseCard(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.internationallicense);
                              },
                              imageColor:
                                  const Color.fromARGB(255, 199, 120, 1),
                              textColor: const Color.fromARGB(255, 199, 120, 1),
                              color: Colors.orange.shade100,
                              image: 'assets/images/card.png',
                              text: 'Driving Liscense'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
