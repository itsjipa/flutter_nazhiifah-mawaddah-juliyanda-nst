import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas14/model/image.dart';
import 'package:tugas14/screen/image_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    // provider untuk tugas 13
    final prov = Provider.of<ImageProvider1>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        //  soal prioritas1 poin 1 dan 2
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
                  //  soal prioritas 1 poin 3 dan 4
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
                                  //  soal prioritas 1 pin 5
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
      // soal prioritas 2 poin 1 dan 2
      drawer: Drawer(
        backgroundColor: Colors.purple.shade50,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 35.0,
          ),
          children: <Widget>[
            InkWell(
              splashColor: Colors.blueAccent.shade400,
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              child: const Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(color: Colors.black,),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              splashColor: Colors.blueAccent.shade400,
              onTap: () {
                Navigator.of(context).pushNamed('/contact');
              },
              child: const Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(color: Colors.black,),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              splashColor: Colors.blueAccent.shade400,
              onTap: () {
                Navigator.of(context).pushNamed('/form');
              },
              child: const Text(
                'Form',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
