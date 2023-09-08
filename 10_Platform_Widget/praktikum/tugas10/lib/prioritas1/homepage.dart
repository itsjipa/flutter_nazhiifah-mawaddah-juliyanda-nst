import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = {
      "data": [
        {
          "nama": "Leanne Graham",
          "number": "1-770-736-8031 x56442",
        },
        {
          "nama": "Erwin Howell",
          "number": "010-692-6593 x09125",
        },
        {
          "nama": "Clemantine Bauch",
          "number": "1-463-123-4447",
        },
        {
          "nama": "Patricia Lebsack",
          "number": "493-170-9623 x156",
        },
        {
          "nama": "Chelsey Dietrich",
          "number": "(254)954-1289",
        },
        {
          "nama": "Mrs. Dennis Schulist",
          "number": "1-477-935-8478 x6430",
        },
        {
          "nama": "Kurtis Weissnat",
          "number": "210.067.6132",
        },
      ],
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("MaterialApp"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 15),
          children: [
            ListTile(
              title: Text("Home"),
            ),
            ListTile(
              title: Text("Settings"),
            ),
          ],
        ),
      ),     
      body: Center(
        child: FutureBuilder(
            future: Future.delayed(
              Duration(seconds: 6),
            ),
            builder: (context, element) {
              if (element.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "This is a material App",
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: ListView.builder(
                      itemCount: data['data']!.length,
                      itemBuilder: (context, index) {
                        var item = data['data']![index];
                        return ListTile(
                          title: Text(
                            item['nama'].toString(),
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            item['number'].toString(),
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text(
                              item['nama'].toString()[0],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
    );
  }
}
