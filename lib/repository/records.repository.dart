import 'package:demo_app/models/records.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordsRepository extends GetxController {
  static RecordsRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createRecord(Records record) async {
    await _db.collection("Records").add(record.toJson());
    //     .whenComplete(
    //       () => Get.snackbar("Success", "Added Successfully",
    //           snackPosition: SnackPosition.BOTTOM,
    //           backgroundColor: Colors.green.withOpacity(0.1),
    //           colorText: Colors.green),
    //     )
    //     .catchError((error, stackTrace) {
    //   Get.snackbar("Error", "something went wrong",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red.withOpacity(0.1),
    //       colorText: Colors.red);
    //   print(error.toString());
    // });
  }

  Future<List<Records>> fetchData() async {
    final snapshot = await _db.collection("Records").get();
    
    final userData = snapshot.docs.map((e) => Records.fromSnapshot(e)).toList();
    return userData;
  }
}
