// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas19/model/openai_model.dart';
import 'package:tugas19/model/service/openai_service.dart';

class OpenAIProvider extends ChangeNotifier {
  final OpenAIService openAIService = OpenAIService();

  final formKey = GlobalKey<FormState>();
  final TextEditingController budgetController = TextEditingController();
  final CurrencyTextInputFormatter budgetControllerFormatter =
      CurrencyTextInputFormatter(
    locale: 'id_ID',
    symbol: ' ',
    decimalDigits: 0,
  );

  List<String> storageOption = [
    '16',
    '32',
    '64',
    '128',
    '256',
    '512',
  ];

  String? selectStorage;
  final TextEditingController cameraController = TextEditingController();

  final formatCurrency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );

  OpenAIModel? openAIModel;

  Future<void> getRecomendations({
    required int budget,
    required String camera,
    required String selectStorage,
  }) async {
    try {
      final phoneBudget = formatCurrency.format(budget);

      debugPrint(phoneBudget);
      debugPrint(camera);
      debugPrint(selectStorage);

      final String prompt =
          "Based on the budget of $budget , here are smartphone recommendations available in that price range you can get a camera with $camera MP, and the storage is $selectStorage GB";
      openAIModel = await openAIService.getRecomendations(
        prompt: prompt,
      );
      notifyListeners();
    } on DioException catch (e) {
      print(e);

    }
  }
}
