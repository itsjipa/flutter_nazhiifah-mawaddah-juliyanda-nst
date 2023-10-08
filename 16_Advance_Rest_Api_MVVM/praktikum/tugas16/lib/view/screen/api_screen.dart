import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas16/model/service/api_service.dart';

class APIScreen extends StatelessWidget {
  const APIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<APIService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('API HOMEPAGE'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: apiProvider.formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: apiProvider.nameController,
                      validator: (value) =>
                          value == null ? 'Masukkan Nama' : null,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Name'),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: apiProvider.jobController,
                      validator: (value) =>
                          value == null ? 'Masukkan Job Anda' : null,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Job'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await apiProvider.getUser();
                    },
                    child: const Text('Get'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (apiProvider.formKey.currentState!.validate()) {
                        apiProvider.formKey.currentState!.save();
                        await apiProvider.postUser(
                          name: apiProvider.nameController.text.trim(),
                          job: apiProvider.jobController.text.trim(),
                        );
                      }
                    },
                    child: const Text('Push'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (apiProvider.formKey.currentState!.validate()) {
                        apiProvider.formKey.currentState!.save();
                        await apiProvider.puttUser(
                          name: apiProvider.nameController.text.trim(),
                          job: apiProvider.jobController.text.trim(),
                        );
                      }
                    },
                    child: const Text('Put'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Consumer<APIService>(builder: (context, apiProvider, _) {
                return Text(
                  (apiProvider.results ?? '-').toString(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    wordSpacing: 2.0,
                  ),
                );
              })
            ],
          ),
        ),
      ),
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
                'API',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              splashColor: Colors.blueAccent.shade400,
              onTap: () {
                Navigator.of(context).pushNamed('/image');
              },
              child: const Text(
                'Foto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
