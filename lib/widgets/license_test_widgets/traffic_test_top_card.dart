import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class TrafficSignTopContainer extends StatelessWidget {
  const TrafficSignTopContainer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      height: screenheight(context) * 0.35,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Text(
                    'License',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('object');
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 130,
            )
          ],
        ),
      ),
    );
  }
}
