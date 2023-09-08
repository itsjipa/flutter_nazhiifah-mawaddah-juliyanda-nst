import 'package:flutter/material.dart';
import 'package:tugas11/screen/contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  List<Contact> _contacts = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Icon(
                Icons.contact_phone_outlined,
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create New Contacts",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                endIndent: 15.0,
                indent: 15.0,
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        if (value.length < 2) {
                          return "Nama harus memiliki minimal 2 kata";
                        }
                        if (value.split(' ').every((element) => element[0] == element[0].toLowerCase())) {
                          return 'Nama harus dimulai dengan huruf kapital';
                        }
                        if (value.contains(RegExp(r'[\d\W]'))) {
                          return 'Nama tidak boleh mengandung angka dan karakter';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      // onSaved: (val) => setState(() => _contact.nama = val!) ,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        hintText: 'Insert Your Name',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // onSaved: (val) => setState(() => _contact.nomor = val!),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor harus diisi';
                        }
                        if (value.contains(r'[\d]')) {
                          return 'Nomor harus terdiri dari angka';
                        }
                        if (value.length < 8 || value.length >= 15) {
                          return "Nomor telepon minimal 8 digit dan maksimal 15 digit";
                        }
                        if (!value.startsWith('0')) {
                          return 'Nomor telepon dimulai 0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        hintText: '+62 ....',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                        labelText: 'Nomor',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () async{
                    var form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      print("title : Contacts${_contacts.length}, subtitle : Contacts");
                    }
                    _contacts.add(Contact(nama: , nomor: nomor));
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              Card(
                child: ListView.builder(itemCount: _contacts.length, itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(_contacts[index].nama[0]),
                        ),
                        title: Text(_contacts[index].nama),
                        subtitle: Text(_contacts[index].nomor),
                        onTap: (){},
                      ),
                      Divider(),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
