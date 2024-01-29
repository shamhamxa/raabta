import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/license_test_widgets/license_test_card.dart';
import 'package:raabta/widgets/license_test_widgets/traffic_test_top_card.dart';
import 'package:raabta/widgets/side_bar.dart';

class TrafficSignTest extends StatelessWidget {
  const TrafficSignTest({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   foregroundColor: Colors.white,
      // ),
      drawer: const SideBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TrafficSignTopContainer(scaffoldKey: scaffoldKey),
          SizedBox(
            height: screenheight(context) * 0.04,
          ),
          SizedBox(
            height: screenheight(context) * 0.58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LicenseTestCard(
                  textColor: const Color.fromRGBO(16, 77, 128, 1),
                  borderColor: const Color.fromRGBO(16, 77, 128, 1),
                  containerColor: Colors.blue.shade100,
                  image: 'assets/images/checked.png',
                  text: '   Prepare Yourself',
                  urduText: 'اپنے آپ کو تیار کرو   ',
                ),
                LicenseTestCard(
                    textColor: const Color.fromARGB(255, 42, 107, 44),
                    image: 'assets/images/checked.png',
                    borderColor: const Color.fromARGB(255, 41, 103, 43),
                    containerColor: Colors.green.shade100,
                    text: '   Start Test',
                    urduText: 'ٹیسٹ شروع کریں   '),
                const LicenseTestCard(
                    textColor: Color.fromARGB(255, 61, 34, 84),
                    image: 'assets/images/checked.png',
                    borderColor: Color.fromARGB(255, 75, 41, 103),
                    containerColor: Color.fromARGB(255, 242, 207, 248),
                    text: '   Score',
                    urduText: ' سکور   '),
              ],
            ),
          )
        ],
      ),
    );
  }
}
