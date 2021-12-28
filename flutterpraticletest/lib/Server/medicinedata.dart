import 'dart:convert';

import 'package:flutterpraticletest/server/api.dart';
import 'package:flutterpraticletest/server/model/medicineDataModel.dart';
import 'package:http/http.dart' as http;

MedicationsAPI(Function(List<Problems> medicineData) callback,
    Function(String) callbackError) async {
  try {
    var url = "${BASE_URL}";
    var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
    var jsonResult = json.decode(response.body);
    MedicineDataModel ret = MedicineDataModel.fromJson(jsonResult);
    if (ret.problems != null) {
      callback(ret.problems);
    } else
      callbackError("Error");
  } catch (ex) {
    callbackError(ex.toString());
  }
}
