import 'package:dio/dio.dart';
import 'package:tugas16/model/image_model.dart';

class ImageService {
  final Dio dio = Dio();

  final String baseUrl = 'https://api.dicebear.com/7.x';

  Future<ImageModel> fetchImage(String name) async {
    String encodeName = Uri.encodeComponent(name);
    String fullUrl = '$baseUrl/$encodeName/svg';

    Response response = await dio.get(fullUrl);
    if (response.statusCode == 200) {
      return ImageModel(name: name, url: fullUrl);
    } else {
      throw Exception('Failed to get image from API');
    }
  }
}
