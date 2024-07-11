import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/screens/challan.dart';
import 'package:raabta/screens/dashboard.dart';
import 'package:raabta/screens/vehicle.dart';
import 'package:raabta/widgets/my_nav.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyNav(),
      body: Consumer<UIcontroller>(
        builder: (context, provider, child) {
          return PageStorage(
            bucket: provider.pageStorageBucket,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: provider.pageController,
              onPageChanged: (value) {
                // provider.changeindex(value);
                log('page ${provider.currentIndex.toString()}');
              },
              children: const [
                Dashboard(),
                Challan(),
                VehicleLicense(),
              ],
            ),
          );
        },
      ),
    );
  }
}
