import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/challan_model.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/app_button.dart';
import 'package:raabta/widgets/side_bar.dart';

class Challan extends StatefulWidget {
  const Challan({super.key});

  @override
  State<Challan> createState() => _ChallanState();
}

class _ChallanState extends State<Challan> {
  final formKey = GlobalKey<FormState>();
  final challanController = TextEditingController();
  dynamic ticketData;
  List<dynamic>? ticketList;
  ChallanModel? challanModel;
  Map<String, dynamic> outputMap = {};
  bool isloading = false;
  Future<ChallanModel> getChallanData(
      {required TextEditingController ticketID}) async {
    final Map<String, dynamic> bodyMap = {
      "AuthenticationObject": {
        "UserName": "0000",
        "Password": "0000",
        "TokenNumber": "38BB1880-30DB-435F-A413-3D2DCA62EEB5",
        "DeviceSerial": "Rabta app",
        "ApplicationName": "KP TTMS"
      },
      "ProductObject": {"ProductCode": "1", "ActionType": "14"},
      "Input1": [ticketID.text.trim()]
    };
    final bodyString = jsonEncode(bodyMap);
    final response = await http.post(
      Uri.parse('https://demokpservice.a2z.care/api/Process'),
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: bodyString,
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body.toString());

      challanModel = ChallanModel.fromJson(jsonMap);
      print('status : ${challanModel!.responseObject!.status}');
      print('status : ${challanModel!.responseObject!.statusDetails}');

      if (challanModel!.responseObject!.status == true) {
        outputMap = jsonDecode(challanModel!.output.toString());
      }

// Access the 'Table' key from the map, which contains the list of ticket data
      setState(() {
        ticketList = outputMap['Table'];
      });

// Now you can access individual ticket data from the list
      // for (ticketData in ticketList) {
      //   print('Ticket ID: ${ticketData['TicketID']}');
      //   print('Ticket No: ${ticketData['TicketNo']}');
      //   print('Offender Name: ${ticketData['OffenderName']}');
      //   // Access other fields similarly
      // }
      return challanModel!;
    } else {
      print('object');
      throw Exception('Failed to load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text(
          'CHALLAN DETAILS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   // Status bar color
        //   statusBarColor: Colors.red,

        //   // Status bar brightness (optional)
        //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
        // ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              ticketList == null
                  ? Image.asset(
                      'assets/images/logo.png',
                      height: 120,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: screenwidth(context) * 0.7,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            hintText: 'Enter challan token',
                            prefixIcon: Icon(
                              Icons.generating_tokens,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        controller: challanController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isloading
                      ? const CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            setState(() {
                              isloading = true;
                            });
                            await getChallanData(ticketID: challanController);
                            setState(() {
                              FocusScope.of(context).unfocus();
                              isloading = false;
                            });
                            if (challanModel!.responseObject!.status == false) {
                              // ignore: use_build_context_synchronously
                              return showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                      challanModel!
                                          .responseObject!.statusDetails
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    title: Image.asset(
                                      'assets/images/cross.png',
                                      height: 80,
                                    ),
                                    actions: [
                                      AppButton(
                                          ontap: () {
                                            Navigator.pop(context);
                                          },
                                          isEnable: true,
                                          text: 'Retry',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            size: 26,
                          ),
                        ),
                ],
              ),
              ticketList != null
                  ? SizedBox(
                      height: screenheight(context) * 0.7,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ticketList!.length,
                        itemBuilder: (context, index) {
                          final ticket = ticketList?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Card(
                              elevation: 3,
                              color: Colors.green.shade50,
                              // surfaceTintColor: Colors.transparent,
                              child: DataTable(
                                  dataRowMaxHeight: 50,
                                  columnSpacing: 40,
                                  decoration: const BoxDecoration(),
                                  dividerThickness: 0.1,
                                  columns: [
                                    const DataColumn(
                                      label: Text('Name'),
                                    ),
                                    DataColumn(
                                      label: Text(ticket != null
                                          ? ticket['OffenderName'].toString()
                                          : ''),
                                    ),
                                  ],
                                  rows: [
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Ticket ID'),
                                        ),
                                        DataCell(
                                          Text(ticket != null
                                              ? ticket['TicketID'].toString()
                                              : ''),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('TO Name'),
                                        ),
                                        DataCell(
                                          Text(ticket != null
                                              ? ticket['TOName'].toString()
                                              : ''),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Ticket No'),
                                        ),
                                        DataCell(
                                          Text(ticket != null
                                              ? ticket['TicketNo'].toString()
                                              : ''),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Document Number'),
                                        ),
                                        DataCell(
                                          Text(ticket['DocumentNumber']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('District Name'),
                                        ),
                                        DataCell(
                                          Text(ticket['DistrictName']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Issuance Date Time'),
                                        ),
                                        DataCell(
                                          Text(ticket['IssuanceDateTime']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Info Message'),
                                        ),
                                        DataCell(
                                          Text(ticket['InfoMessage']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Ticket Status'),
                                        ),
                                        DataCell(
                                          Text(ticket['TicketStatus']),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
