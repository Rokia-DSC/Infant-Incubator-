import 'package:flutter/material.dart';
import 'package:infant_incubator/model/infant_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InfantHttpService extends GetxController {
  static String baseUrl = 'https://tadawy-production.up.railway.app';
  var infants = <InfantModel>[].obs;
  var isLoading = true.obs;
  // List<InfantModel> infants = [];

  void onInit() {
    super.onInit();
    fetchInfantData();
  }

  Future<List<InfantModel>> fetchInfantData() async {
    final response = await http.get(Uri.parse('${baseUrl}/api/infant'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      

      infants.add(InfantModel.fromJson(jsonResponse['color_sensor']));
      infants.add(InfantModel.fromJson(jsonResponse['heart_rate']));
      infants.add(InfantModel.fromJson(jsonResponse['temperature']));
      infants.add(InfantModel.fromJson(jsonResponse['humidity']));
      
      isLoading.value = false;
      update();

      return infants;
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      throw Exception('Failed to load infant data');
    }
  }
}
