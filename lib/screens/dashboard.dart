import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:raabta/controller/slider_controller.dart';
import 'package:raabta/generic_webview.dart';
import 'package:raabta/model/slider_model.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/screens/google_map.dart';
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

class _DashboardState extends State<Dashboard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Data>? sliderDataList;
  String baseUrl = 'https://raabta.ptpkp.gov.pk/dashboard/uploads/slider/';

  Future<void> getSliderData() async {
    try {
      final response = await http.get(
        Uri.parse('https://raabta.ptpkp.gov.pk/dashboard/api/services/sliders'),
      );
      if (response.statusCode == 200) {
        log(response.body.toString());
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
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'R A A B T A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        foregroundColor: Colors.white,
      ),
      drawer: Padding(
        padding: EdgeInsets.only(top: screenheight(context) * 0.1),
        child: const SideBar(),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: 0,
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/kpk.png',
              height: 200,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        context
                            .read<SliderController>()
                            .changeIndex(index);
                      },
                    ),
                  )
                      : SizedBox(
                    height: screenheight(context) * 0.20,
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
                          color: Colors.white.withOpacity(0.6),
                          image: 'assets/images/list.png',
                          text: 'Offense List'),
                      DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const TrafficSignTest()));
                        },
                        // imagecolors: const Color.fromARGB(255, 197, 120, 4),
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/checked.png',
                        text: 'Traffic Sign Test',
                        textColor: const Color.fromARGB(255, 197, 120, 4),
                      ),
                      DashboardCard(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.trafficeducation);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/siren.png',
                        text: 'Traffic Education',
                        textColor: const Color.fromARGB(255, 162, 44, 35),
                      ),
                    ],
                  ),
                  Row(
                    children: [

                      DashboardCard(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRouter.liscense);
                        },
                        imagecolors: Colors.teal,
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/id-card.png',
                        text: 'Liscense Procedure',
                        textColor: Colors.teal,
                      ),
                      DashboardCard(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.emergencynumbers);
                          },
                          color: Colors.white.withOpacity(0.6),
                          image: 'assets/images/warn.png',
                          text: 'Emergency Numbers',
                          textColor: Colors.orange),

                      DashboardCard(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRouter.weather);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/cloudy.png',
                        text: 'Weather',
                        textColor: Colors.blueGrey.shade700,
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const GenericWebViewPage(
                                      url: 'https://ttmswebview.a2z.care/RaabtaApp/DrivingSchoolIndex',
                                      title: 'Driving Schools')));

                          // Navigator.of(context).pushNamed(AppRouter.weather);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/car.png',
                        text: 'Driving Schools',
                        textColor: Colors.orange,
                      ),
                      DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const GenericWebViewPage(
                                      url: 'https://ttmswebview.a2z.care/RaabtaApp/DLBranchesIndex',
                                      title: 'License Branches')));

                          // Navigator.of(context).pushNamed(AppRouter.weather);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/drivers-license.png',
                        text: 'License Branches',
                        textColor: const Color.fromRGBO(24, 110, 180, 1),
                      ),
                      DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const GenericWebViewPage(
                                      url: 'https://ttmswebview.a2z.care/RaabtaApp/DLFeeIndex',
                                      title: 'Driving License Fee')));

                          // Navigator.of(context).pushNamed(AppRouter.weather);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/fees.png',
                        text: 'Driving License Fee',
                        textColor: Colors.teal,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const GenericWebViewPage(url: 'https://ptpkp.gov.pk/driving-license-verification/', title: 'K P K')));
                      //   },
                      //   child: Column(
                      //     children: [
                      //       Image.asset(
                      //         kpkimage,
                      //         height: 55,
                      //       ),
                      //       const SizedBox(height: 5),
                      //       Text(
                      //         kpklabel,
                      //         // style: const TextStyle(
                      //         //   color: Color.fromARGB(255, 106, 189, 161),
                      //         // ),
                      //       )
                      //     ],
                      //   ),
                      // ),

                    ],
                  ),
                  Row(
                    children: [
                      DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const GenericWebViewPage(
                                      url: 'https://ttmswebview.a2z.care/RaabtaApp/ImportantPlaces',
                                      title: 'Important Places')));

                          // Navigator.of(context).pushNamed(AppRouter.weather);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/location-pin.png',
                        text: 'Important Places',
                        textColor: const Color.fromARGB(255, 162, 44, 35),
                      ), DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const GenericWebViewPage(
                                      url: 'https://ttmswebview.a2z.care/RaabtaApp/AddFeedBack',
                                      title: 'Feedback')));

                          // Navigator.of(context).pushNamed(AppRouter.weather);
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/feedback.png',
                        text: 'Feedback',
                        textColor: const Color.fromRGBO(24, 110, 180, 1),
                      ), DashboardCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const GenericWebViewPage(
                                      url: 'https://ttmswebview.a2z.care/RaabtaApp/AddIncidentReport',
                                      title: 'Report Incident')));
                        },
                        color: Colors.white.withOpacity(0.6),
                        image: 'assets/images/report.png',
                        text: 'Report Incident',
                        textColor: const Color.fromARGB(255, 197, 120, 4),
                      ),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

