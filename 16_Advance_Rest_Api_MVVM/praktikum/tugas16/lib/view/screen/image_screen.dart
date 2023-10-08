import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tugas16/viewmodel/provider/image_provider.dart';


class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageProvider1>(builder: (context, imageProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('DICEBEAR API'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.purple)),
                child: imageProvider.imageModel == null
                    ? Container()
                    : SvgPicture.network(
                        imageProvider.imageModel!.url,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: imageProvider.textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter some text',
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  String name = imageProvider.textEditingController.text;
                  imageProvider.fetchImage(name);
                },
                child: const Text(
                  'Generate',
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
