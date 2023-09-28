import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas13/screen/image_screen.dart';
import 'package:tugas13/models/image.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ImageProvider1>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: prov.images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            // untuk bisa scroll
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              var item = prov.images[index];
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 320,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/$item',
                                width: 250,
                                height: 220,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              //  button ya dan tidak
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImagePage(
                                            image: item,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Yes',
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurpleAccent.shade100,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'No',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/$item',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
