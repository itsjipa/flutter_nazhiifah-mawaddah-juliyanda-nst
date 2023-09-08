import 'package:flutter/material.dart';
import 'package:tugas11/screen/contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nomotController = TextEditingController();

  List<Contact> _contacts = List.empty(growable: true);

  int selectIndex = 0;
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
              const Icon(
                Icons.contact_phone_outlined,
                color: Colors.black54,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Create New Contacts",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                endIndent: 15.0,
                indent: 15.0,
              ),
              const SizedBox(
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
                        if (value.split(' ').every((element) =>
                            element[0] == element[0].toLowerCase())) {
                          return 'Nama harus dimulai dengan huruf kapital';
                        }
                        if (value.contains(RegExp(r'[\d\W]'))) {
                          return 'Nama tidak boleh mengandung angka dan karakter';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      controller: _namaController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        hintText: 'Insert Your Name',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _nomotController,
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
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 15.0,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    var form = _formKey.currentState;
                    String nama = _namaController.text.trim();
                    String nomor = _nomotController.text.trim();

                    if (form!.validate()) {
                      form.save();
                      // print(
                      //     "title : Contacts${_contacts.length}, subtitle : Contacts");
                      // print(_contacts.asMap());
                      setState(() {
                        _namaController.text = '';
                        _nomotController.text = '';
                        _contacts.add(Contact(nama: nama, nomor: nomor));
                      });
                    }

                    form.reset();
                  },
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              _contacts.isEmpty
                  ? Container()
                  : const Text(
                      "List Contacts",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              _contacts[index].nama[0],
                            ),
                          ),
                          title: Text(_contacts[index].nama),
                          subtitle: Text(_contacts[index].nomor),
                          trailing: SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      _namaController.text =
                                          _contacts[index].nama;
                                      _nomotController.text =
                                          _contacts[index].nomor;
                                      setState(() {
                                        selectIndex = index;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 17,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _contacts.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
