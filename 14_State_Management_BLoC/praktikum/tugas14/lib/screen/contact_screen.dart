import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas14/bloc/contact_bloc.dart';
import 'package:tugas14/model/contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomotController = TextEditingController();

  String name = '';
  String number = '';

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
      body: BlocBuilder<ContactBlocBloc, ContactBlocState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                        // untuk form name
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

                        // untuk form number
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
                      onPressed: () {
                        Contacts contacts = Contacts(
                            name: _namaController.text.trim(),
                            number: _nomotController.text.trim());
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<ContactBlocBloc>()
                              .add(AddContactEvent(contacts));
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
                  BlocConsumer<ContactBlocBloc, ContactBlocState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final contacts = state.contacts;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  // menampilkan index ke-0 dari name
                                  ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                        contacts[index].name[0],
                                      ),
                                    ),
                                    // menampilkan name
                                    title: Text(contacts[index].name),
                                    // menampilkan number
                                    subtitle: Text(contacts[index].number),
                                    trailing: SizedBox(
                                      width: 60,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            // untuk edit kontak
                                            child: IconButton(
                                              onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Update Contacts',
                                                      ),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                TextEditingController(
                                                                    text: contacts[
                                                                            index]
                                                                        .name),
                                                            onChanged: (value) {
                                                              contacts[index]
                                                                  .name = value;
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Name'),
                                                          ),
                                                          SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          TextField(
                                                            controller:
                                                                TextEditingController(
                                                                    text: contacts[
                                                                            index]
                                                                        .number),
                                                            onChanged: (value) {
                                                              contacts[index]
                                                                      .number =
                                                                  value;
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Number'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              BlocProvider.of<
                                                                          ContactBlocBloc>(
                                                                      context)
                                                                  .add(EditContactEvent(
                                                                      index,
                                                                      name,
                                                                      number));
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'Submit',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                              icon: const Icon(
                                                Icons.edit,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),

                                          // untuk hapus kontak
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<ContactBlocBloc>()
                                                    .add(DeleteContactEvent(
                                                        index));
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
                      })
                ],
              ),
            ),
          );
        },
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
                Navigator.of(context).pushNamed('/galery');
              },
              child: const Text(
                'Gallery',
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
                Navigator.of(context).pushNamed('/');
              },
              child: const Text(
                'Contacts',
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
