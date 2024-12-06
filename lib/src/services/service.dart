import 'dart:convert';

import 'package:example/src/model/ApartmentModel.dart';
import 'package:flutter/services.dart' as rootBundle;

Future<List<ApartmentModel>> loadApartmentFromJson() async {
  String jsonString = await rootBundle.rootBundle.loadString('assets/apartments.json');
  List<dynamic> jsonList = json.decode(jsonString);
  List<ApartmentModel> apartments = jsonList.map((json)=>ApartmentModel.fromJson(json)).toList();
  return apartments;
}