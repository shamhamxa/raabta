import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/offense_model.dart';

class OffenseList extends StatefulWidget {
  const OffenseList({super.key});

  @override
  State<OffenseList> createState() => _OffenseListState();
}

class _OffenseListState extends State<OffenseList> {
  Future<OffenseModel> getData() async {
    final response = await http.get(
      Uri.parse('https://ptpkp.gov.pk/dashboard/api/services/offencelist'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body.toString());

      OffenseModel offenseModel = OffenseModel.fromJson(jsonMap);
      print("Message: ${offenseModel.message}");
      print("Status: ${offenseModel.status}");
      print("Data:");

      log('valid');
      return offenseModel;
    } else {
      print('object');
      throw Exception('Failed to load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: const Text('Offense List'),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  final offenseData = snapshot.data!.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Violation Code ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(97, 97, 97, 1),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  offenseData.offenceCodes.toString(),
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    offenseData.engTitle ?? '',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    offenseData.urdTitle!,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      // mainAxisSize: MainAxisSize.min,

                                      children: [
                                        const Text('MoterCycle : '),
                                        Text(
                                          offenseData.motorCycle.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Text('Car/Jeep : '),
                                        Text(
                                          offenseData.carJeep.toString(),
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('PSV/LTV : '),
                                        Text(
                                          offenseData.ltv!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Text('HTV : '),
                                        Text(
                                          offenseData.psvHtv!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // ElevatedButton(onPressed: () {}, child: const Text('kamal'))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
