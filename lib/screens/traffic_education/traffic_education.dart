import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/traffic_model.dart';
import 'package:raabta/screens/traffic_education/image_education.dart';

class TrafficEducation extends StatefulWidget {
  const TrafficEducation({Key? key}) : super(key: key);

  @override
  State<TrafficEducation> createState() => _TrafficEducationState();
}

class _TrafficEducationState extends State<TrafficEducation> {
  List<TrafficModel>? trafficDataList;
  String baseUrl = 'https://ptpkp.gov.pk/dashboard/uploads/traffic-education/';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://ptpkp.gov.pk/dashboard/traffic_education/getEducationSigns'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body.toString());
        Traffic traffic = Traffic.fromJson(map);
        setState(() {
          trafficDataList = traffic.traffic!;
          log(trafficDataList!.length.toString());
        });
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Traffic Education'),
      ),
      body: trafficDataList != null
          ? GridView.builder(
              itemCount: trafficDataList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                final trafficData = trafficDataList![index];
                String imageUrl = baseUrl + trafficData.image;

                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageEducation(
                              trafficModel: trafficData, image: imageUrl),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) {
                            return Center(
                                child: Container(
                              color: Colors.grey[200],
                            ));
                          },
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fill),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
