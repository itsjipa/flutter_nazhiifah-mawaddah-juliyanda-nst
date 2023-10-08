import 'package:flutter/material.dart';
import 'package:tugas16/model/image_model.dart';
import 'package:tugas16/model/service/image_service.dart';

// class ImageProvider extends ChangeNotifier {
//   ImageService imageService = ImageService();

//   Image? _image;

//   Image? get image => _image;

//   void fetchImage(String text) async {
//     try {
//       ImageModel result = await imageService.fetchImage(text);
//       _image = result as Image?;
//       notifyListeners();
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }

class ImageProvider1 extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  ImageModel? imageModel;

  Future<void> fetchImage(String name) async {
    ImageService imageService = ImageService();
    try {
      ImageModel imageData = await imageService.fetchImage(name);
      imageModel = imageData;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
