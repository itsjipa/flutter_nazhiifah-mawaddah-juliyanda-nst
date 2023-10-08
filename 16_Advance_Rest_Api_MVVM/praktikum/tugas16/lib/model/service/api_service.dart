import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tugas16/model/api_model.dart';

class APIService extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  String? results;

  final Dio dio = Dio();

  Future getUser() async {
    try {
      final Response getResponse = await dio.get("https://reqres.in/api/users");
      debugPrint(getResponse.data.toString());
      final result = getResponse.data;
      results = result.toString();
      notifyListeners();
    } catch (e) {
      return e;
    }
  }

  Future postUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response postResponse = await dio.post(
        "https://reqres.in/api/users",
        data: {
          'name': name,
          'job': job,
        },
      );
      debugPrint(postResponse.data.toString());
      APIModel.fromJson(postResponse.data);
      results = postResponse.data.toString();
      notifyListeners();
    } catch (e) {
      return e;
    }
  }

  Future puttUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response putResponse = await dio.put(
        "https://reqres.in/api/users/2",
        data: {
          'name': name,
          'job': job,
        },
      );
      debugPrint(putResponse.data.toString());

      final result = putResponse.data;
      results = result.toString();
      notifyListeners();
    } catch (e) {
      return e;
    }
  }
}
