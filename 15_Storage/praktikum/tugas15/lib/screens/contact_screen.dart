import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas15/model/contact.dart';
import 'package:tugas15/model/db_manager.dart';
import 'package:tugas15/screens/contact_login.dart';
import 'package:tugas15/utils/contact_sharedpreferences.dart';

class ContactScreen extends StatefulWidget {
  final Contacts? contacts;
  const ContactScreen({Key? key, this.contacts}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomotController = TextEditingController();
  int selectIndex = 0;
  String username = '';
  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    _getUserName();
    if (widget.contacts != null) {
      _namaController.text = widget.contacts!.name;
      _nomotController.text = widget.contacts!.number;
      _isUpdate = true;
    }
  }

  _getUserName() async {
    String? name = await LoginSharedPreferences.getUserNamePreference();
    setState(() {
      username = name!;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nomotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DbManager>(context, listen: false);
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
        actions: [
          IconButton(
            onPressed: () async {
              _logOut();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text('Welcome, $username', textAlign: TextAlign.left, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10.0,
              ),
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
                        if (value.contains(RegExp(r'\D'))) {
                          return 'Nomor harus terdiri dari angka';
                        }
                        if (value.length < 8 || value.length > 15) {
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
                    if (!_isUpdate || form!.validate()) {
                      final contacts = Contacts(
                        name: _namaController.text.trim(),
                        number: _nomotController.text.trim(),
                      );
                      prov.addContacts(contacts);
                    } else {
                      final contacts = Contacts(
                        name: _namaController.text,
                        number: _nomotController.text,
                      );
                      prov.updateContacts(contacts);
                    }
                    _namaController.clear();
                    _nomotController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Submit'),
                ),
              ),
              Consumer<DbManager>(
                builder: (context, contacts, _) {
                  prov.contacts.isEmpty
                      ? Container()
                      : const Text(
                          "List Contacts",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        );
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: prov.contacts.length,
                      itemBuilder: (context, index) {
                        final item = prov.contacts[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  prov.contacts[index].name[0],
                                ),
                              ),
                              title: Text(prov.contacts[index].name),
                              subtitle: Text(prov.contacts[index].number),
                              trailing: SizedBox(
                                width: 60,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          contacts.updateContacts(
                                            Contacts(
                                                name: _namaController.text =
                                                    prov.contacts[index].name,
                                                number: _nomotController.text =
                                                    prov.contacts[index]
                                                        .number),
                                          );
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
                                          contacts.deleteContacts(item.id!);
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
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logOut() async {
    await LoginSharedPreferences.saveUserLogInPrefernces(false);
    await LoginSharedPreferences.saveUserNamePreference('');

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
