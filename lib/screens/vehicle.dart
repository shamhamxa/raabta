import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/license_model.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/app_button.dart';
import 'package:raabta/widgets/side_bar.dart';

class VehicleLicense extends StatefulWidget {
  const VehicleLicense({super.key});

  @override
  State<VehicleLicense> createState() => _VehicleLicenseState();
}

class _VehicleLicenseState extends State<VehicleLicense> {
  final vehicleLicenseController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LicenseModel? licenseModel;
  Map<String, dynamic>? licenseDataJson;
  bool isloading = false;

  Future<LicenseModel> getLicenseData() async {
    final response = await http.post(Uri.parse(
        'https://api.ptpkp.gov.pk/api.php?key=GMSlzJPqDzGgx1OsBC7B5YYTNh27eL9d&search=1410137010071'));

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body.toString());
      log('message');
      licenseModel = LicenseModel.fromJson(jsonMap);

      log('hi');
      if (jsonMap != null && jsonMap['LICENSE_DATA'] == "[]") {
        log('saqlain');

        licenseDataJson = null; // Set to null if it's a list
      } else {
        log('kamal');
        licenseDataJson = json.decode(jsonMap['LICENSE_DATA']);
      }

      print(licenseDataJson?['nic'].toString());
      return licenseModel!;
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
          'LICENSE DETAILS',
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
              licenseDataJson == null
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'cannot be empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: const Text(
                              'Enter Cnic Number',
                              style: TextStyle(color: Colors.grey),
                            ),
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            hintText: '1234532334489',
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
                        controller: vehicleLicenseController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isloading
                      ? const Center(
                          child: CircularProgressIndicator(),
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
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isloading = true;
                              });
                              await getLicenseData();
                              setState(() {
                                FocusScope.of(context).unfocus();
                                isloading = false;
                              });
                              if (licenseModel!.error != '0') {
                                // ignore: use_build_context_synchronously
                                return showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        licenseModel!.error.toString(),
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
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            size: 26,
                          ),
                        ),
                ],
              ),
              licenseDataJson != null
                  ? SizedBox(
                      height: screenheight(context) * 0.7,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Card(
                              elevation: 3,
                              color: Colors.white,
                              // surfaceTintColor: Colors.transparent,
                              child: DataTable(
                                  dataRowMaxHeight: 50,
                                  columnSpacing: 40,
                                  decoration: const BoxDecoration(),
                                  dividerThickness: 0.001,
                                  columns: [
                                    const DataColumn(
                                      label: Text('Name'),
                                    ),
                                    DataColumn(
                                      label: Text(licenseDataJson!['name']),
                                    ),
                                  ],
                                  rows: [
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('CNIC'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson!['nic']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Father Name'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson!['father_name']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('License No'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson!['license_no']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('License Type'),
                                        ),
                                        DataCell(
                                          Text(
                                              licenseDataJson!['license_type']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Initial Type'),
                                        ),
                                        DataCell(
                                          Text(
                                              licenseDataJson!['initial_type']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Initial Issue Date'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson![
                                              'initial_issue_date']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Issue Date'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson!['issue_date']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('Expiry Date'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson!['expiry_date']),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(
                                          Text('District'),
                                        ),
                                        DataCell(
                                          Text(licenseDataJson!['district']),
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
