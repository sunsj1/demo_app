import 'package:demo_app/controllers/records.controller.dart';
import 'package:demo_app/screens/stepper_form.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'models/records.dart';

class ScreenRecords extends StatefulWidget {
  ScreenRecords({super.key, required this.recordList});
  RxList<Records> recordList = RxList<Records>([]);
  @override
  State<ScreenRecords> createState() => _ScreenRecordsState();
}

class _ScreenRecordsState extends State<ScreenRecords> {
  final List<DropdownMenuItem<String>> _sortOptions = const [
    DropdownMenuItem(value: 'NA', child: Text('NA')),
  ];
  final List<DropdownMenuItem<String>> _filterOptions = const [
    DropdownMenuItem(value: 'NA', child: Text('NA')),
  ];
  String? selectedSortValue;
  final recordsController = Get.put(RecordsController());

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 2, vsync: this);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              color: const Color(0xFF263252),
              width: size.width,
              height: 90,
              child: TabBar(
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
                labelColor: Colors.white,
                indicatorPadding: const EdgeInsets.all(12),
                unselectedLabelColor: Colors.white.withAlpha(200),
                tabs: const [
                  Tab(text: 'Leads'),
                  Tab(text: 'Team Leads'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 22, horizontal: 5)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterRecords()));
                      },
                      label: const Text(
                        'Add Leads',
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Select Activity',
                      ),
                      items: _sortOptions,
                      value: selectedSortValue,
                      onChanged: (value) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Select Activity',
                      ),
                      items: _sortOptions,
                      value: selectedSortValue,
                      onChanged: (value) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Obx(() {
                    return ListView.builder(
                      itemCount: widget.recordList.length,
                      itemBuilder: (context, index) {
                        final data = recordsController.recordList1;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            shadowColor: Colors.grey,
                            elevation: 5,
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Container(
                                height: null,
                                decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.green, width: 10)),
                                  color: Colors.white,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    widget.recordList[index]
                                                        .leadName
                                                        .toString(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10)),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    widget.recordList[index]
                                                        .companyName
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Type:  ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                    color: Colors.blueGrey
                                                        .withBlue(100)),
                                          ),
                                          Text(
                                            widget.recordList[index].serviceType
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(color: Colors.green),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Deal Amount',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                        color:
                                                            Colors.grey[600]),
                                              ),
                                              Text(
                                                widget.recordList[index]
                                                    .dealAmount
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Income',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                        color:
                                                            Colors.grey[600]),
                                              ),
                                              Text(
                                                widget.recordList[index].salary
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Pincode',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                        color:
                                                            Colors.grey[600]),
                                              ),
                                              Text(
                                                widget.recordList[index].pincode
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.call,
                                                color: Colors.amber[700],
                                              )),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.description,
                                              color: Colors.amber[700],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Lead Status:  ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                        color: Colors.blueGrey
                                                            .withBlue(100)),
                                              ),
                                              Text(
                                                widget.recordList[index]
                                                    .leadStatus
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  const Text('No Data Available')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
