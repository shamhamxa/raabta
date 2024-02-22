import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/side_bar.dart';

class Challan extends StatefulWidget {
  const Challan({super.key});

  @override
  State<Challan> createState() => _ChallanState();
}

class _ChallanState extends State<Challan> {
  final formKey = GlobalKey<FormState>();
  final challanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text(
          'License Details',
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
              Image.asset(
                'assets/images/logo.png',
                height: 120,
              ),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Icon(
                      Icons.search,
                      size: 26,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Card(
                  elevation: 3,
                  color: Theme.of(context).colorScheme.secondary,
                  surfaceTintColor: Colors.transparent,
                  child: DataTable(
                      dataRowMaxHeight: 55,
                      columnSpacing: 80,
                      decoration: const BoxDecoration(),
                      dividerThickness: 0.1,
                      columns: const [
                        DataColumn(
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('Kamal'),
                        ),
                      ],
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(
                              Text('Father Name'),
                            ),
                            DataCell(
                              Text('Iqbal'),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text('CNIC Number'),
                            ),
                            DataCell(
                              Text('17301-999222870-9'),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text('License Number'),
                            ),
                            DataCell(
                              Text('1234567890'),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text('District'),
                            ),
                            DataCell(
                              Text('Peshawar'),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text('License Type'),
                            ),
                            DataCell(
                              Text('Motor Bike'),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text('Expiry Date'),
                            ),
                            DataCell(
                              Text('1-07-2025'),
                            ),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
