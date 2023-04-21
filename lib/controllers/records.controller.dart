import 'package:demo_app/models/records.dart';
import 'package:demo_app/repository/records.repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RecordsController extends GetxController {
  static RecordsController get instance => Get.find();
  final name = TextEditingController();
  final mobile = TextEditingController();
  final recordsRepo = Get.put(RecordsRepository());
  RxList<Records> recordList1 = RxList<Records>([]);
  @override
  void onInit() async {
    super.onInit();
    List<Records> records = await getRecords();
    recordList1.addAll(records);
  }

  Future<void> createRecord(Records record) async {
    await recordsRepo.createRecord(record);
    recordList1.add(record);
  }

  getRecords() {
    final response = recordsRepo.fetchData();
    if (response != null) {
      update();
    }
    return response;
  }

  Future<void> refreshData() async {
    recordsRepo.refresh();
  }
}
