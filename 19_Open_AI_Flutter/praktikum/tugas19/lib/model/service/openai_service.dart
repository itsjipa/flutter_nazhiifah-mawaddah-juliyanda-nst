import 'package:dio/dio.dart';
import 'package:tugas19/model/openai_model.dart';
import 'package:tugas19/utils/constant/openai_constant.dart';

class OpenAIService {
  final Dio _dio = Dio();

  Future<OpenAIModel> getRecomendations({
    required String prompt,
  }) async {
    try {
      final Uri url = Uri.parse('https://api.openai.com/v1/completions');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${OpenAIConstant.apiKey}',
      };

      final Map<String, dynamic> requestBody = {
        "model": "text-davinci-003",
        "prompt": prompt,
        "max_tokens": 80,
        "temperature": 0.4,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      };

      final Response response = await _dio.postUri(
        url,
        data: requestBody,
        options: Options(
          headers: headers,
        ),
      );
      print(response.statusMessage);
      return OpenAIModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
