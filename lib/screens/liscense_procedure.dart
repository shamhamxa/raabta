import 'package:flutter/material.dart';
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
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.45,
        child: Column(
          // scrollDirection: Axis.horizontal,
          children: [
            Expanded(
              child: Scrollbar(
                interactive: false,
                controller: scrollController,
                trackVisibility: true,
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        LiscenseCard(
                            color: Colors.red.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'Learner Permit'),
                        LiscenseCard(
                            color: Colors.blue.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'Fresh Driving Liscense'),
                        LiscenseCard(
                            color: Colors.green.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'Conversion Of Driving Liscense'),
                        LiscenseCard(
                            color: Colors.teal.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'Dublicate Driving Liscense'),
                        LiscenseCard(
                            color: Colors.brown.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'Endoresement Of Driving Liscense'),
                        LiscenseCard(
                            color: Colors.cyan.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'Renewal Of Expired Driving Liscense'),
                        LiscenseCard(
                            color: Colors.purple.shade100,
                            image: 'assets/images/id-card.png',
                            text: 'International Driving Permit'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              child: Text('DRIVING LISCENSE FOR AFGHAN NATIONAL'),
            ),
            Row(
              children: [
                Expanded(
                  child: LiscenseCard(
                      color: Colors.red.shade50,
                      image: 'assets/images/id-card.png',
                      text: 'kamal'),
                ),
                Expanded(
                  child: LiscenseCard(
                      color: Colors.red.shade100,
                      image: 'assets/images/id-card.png',
                      text: 'kamal'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
