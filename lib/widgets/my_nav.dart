import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';

class MyNav extends StatelessWidget {
  const MyNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UIcontroller>(
      builder: (context, value, child) {
        return CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 400),
          index: value.currentIndex,
          // selectedIndex: value.currentIndex,
          color: Theme.of(context).colorScheme.primary,
          // gap: 6,
          // activeColor: Colors.white,
          // tabBackgroundColor: context.read<ThemeProvider>().isdark
          // ? AppColor.greycolor
          // : const Color.fromARGB(255, 192, 133, 215),
          backgroundColor: Colors.white,
          // currentIndex: value.currentIndex,

          onTap: (index) {
            value.changeindex(index);
            log('tab ${value.currentIndex.toString()}');
          },
          // padding: const EdgeInsets.all(10),
          items: [
            const Icon(
              Icons.home,
              color: Colors.white,
            ),
            Image.asset(
              'assets/images/focus.png',
              color: Colors.white,
              height: 30,
            ),
          ],
        );
      },
      // child:
    );
  }
}
