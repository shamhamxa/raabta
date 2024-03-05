import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:raabta/controller/slider_controller.dart';
import 'package:raabta/model/slider_model.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/screens/traffic_sign_test/traffic_sign_test.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/build_image.dart';
import 'package:raabta/widgets/dashboard_widgets/dashboard_card.dart';
import 'package:raabta/widgets/side_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Data>? sliderDataList;
  String baseUrl = 'https://ptpkp.gov.pk/dashboard/uploads/slider/';

  Future<void> getSliderData() async {
    try {
      final response = await http.get(
        Uri.parse('https://ptpkp.gov.pk/dashboard/api/services/sliders'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body.toString());
        SliderModel sliderModel = SliderModel.fromJosn(map);
        setState(() {
          sliderDataList = sliderModel.sliderModel;
        });
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      log('error:::$e');
    }
  }

  @override
  void initState() {
    getSliderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'R A A B T A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const SideBar(),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenheight(context),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              sliderDataList != null
                  ? CarouselSlider.builder(
                      itemCount: sliderDataList!.length,
                      itemBuilder: (context, index, realIndex) {
                        if (sliderDataList!.isEmpty) {
                          // Return a placeholder or loading indicator
                          return const Center(
                              child:
                                  CircularProgressIndicator()); // Example: Loading indicator
                        }
                        final images = sliderDataList![index].image;
                        final text = sliderDataList![index].title;
                        final correctImage = baseUrl + images;
                        return buildImage(correctImage, index, text);
                      },
                      options: CarouselOptions(
                        aspectRatio: 13 / 6,
                        autoPlay: true,
                        // height: 270,
                        onPageChanged: (index, reason) {
                          // print(index);
                          context.read<SliderController>().changeIndex(index);
                        },
                      ),
                    )
                  : SizedBox(
                      height: screenheight(context) * 0.22,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              buildindicator(sliderDataList ?? []),
              Row(
                children: [
                  DashboardCard(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.offense);
                      },
                      textColor: const Color.fromRGBO(24, 110, 180, 1),
                      color: Colors.blue.shade50,
                      image: 'assets/images/list.png',
                      text: 'Offense List'),
                  DashboardCard(
                    onTap: () {
                      Navigator.push(context, _createRoute());
                    },
                    // imagecolors: const Color.fromARGB(255, 197, 120, 4),
                    color: Colors.orange.shade50,
                    image: 'assets/images/checked.png',
                    text: 'Traffic Sign Test',
                    textColor: const Color.fromARGB(255, 197, 120, 4),
                  ),
                ],
              ),
              Row(
                children: [
                  DashboardCard(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRouter.trafficeducation);
                    },
                    color: Colors.red.shade100,
                    image: 'assets/images/warning.png',
                    text: 'Traffic Education',
                    textColor: const Color.fromARGB(255, 162, 44, 35),
                  ),
                  DashboardCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.liscense);
                    },
                    imagecolors: Colors.teal,
                    color: Colors.teal.shade100,
                    image: 'assets/images/id-card.png',
                    text: 'Liscense Procedure',
                    textColor: Colors.teal,
                  ),
                ],
              ),
              Row(
                children: [
                  DashboardCard(
                    onTap: () {},
                    color: Colors.green.shade100,
                    image: 'assets/images/traffic-light.png',
                    text: 'Traffic Status',
                    textColor: const Color.fromARGB(255, 55, 139, 58),
                  ),
                  DashboardCard(
                    imagecolors: const Color.fromARGB(255, 88, 110, 121),
                    onTap: () {},
                    color: Colors.blueGrey.shade100,
                    image: 'assets/images/radio.png',
                    text: 'Live Radio',
                    textColor: const Color.fromARGB(255, 100, 124, 136),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const TrafficSignTest(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0, -1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
