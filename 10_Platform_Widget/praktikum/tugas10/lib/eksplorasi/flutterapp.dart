import 'package:flutter/material.dart';

class EksplorasiHomePage extends StatelessWidget {
  const EksplorasiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      "Learn Flutter",
      "Learn ReactJS",
      "Learn VueJS",
      "Learn Tailwind CSS",
      "Learn UI/UX",
      "Learn Figma",
      "Learn Digital Marketing",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter App"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.search,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: ((context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  list[index],
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff03DAC5),
        splashColor: Colors.black12,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
