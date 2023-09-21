import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String image;

  const ImagePage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  soal eksplorasi
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Page',
        ),
      ),
      body: Center(
        child: Hero(
          tag: image,
          child: Image.asset(
            'assets/$image',
            width: 380,
            height: 300,
          ),
        ),
      ),
    );
  }
}
