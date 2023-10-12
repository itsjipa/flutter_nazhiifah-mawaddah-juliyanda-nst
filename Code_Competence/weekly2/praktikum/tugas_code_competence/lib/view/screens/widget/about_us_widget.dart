import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_code_competence/model/item_store.dart';

class AboutUs extends StatelessWidget {
  final String title;
  final List<ItemStore> itemStore;

  const AboutUs({super.key, required this.title, required this.itemStore});

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.inriaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemStore.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ItemStore itemStores = itemStore[index];
                  return Card(
                    color: Colors.deepOrange.shade800,
                    shadowColor: Colors.black38,
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4.0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 500,
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Image.network(
                              itemStores.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            itemStores.name,
                            style: GoogleFonts.inriaSans(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            itemStores.price,
                            style: GoogleFonts.inriaSans(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
