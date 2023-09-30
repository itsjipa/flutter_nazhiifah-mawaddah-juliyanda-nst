import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas13/models/contact_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final contactsProvider =
        Provider.of<ContactProvider>(context, listen: false);
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
                key: contactsProvider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // untuk form name
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: context.read<ContactProvider>().validatorName,
                      keyboardType: TextInputType.name,
                      controller: contactsProvider.nameController,
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
                      controller: contactsProvider.numberController,
                      validator:
                          context.read<ContactProvider>().validatorNumber,
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
                    contactsProvider.addContacts(
                      contactsProvider.nameController.text.trim(),
                      contactsProvider.numberController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Submit'),
                ),
              ),
              Consumer<ContactProvider>(
                builder: (context, contactProvider, _) {
                  contactsProvider.contact.isEmpty
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
                      itemCount: contactsProvider.contact.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            // menampilkan index ke-0 dari name
                            ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  contactsProvider.contact[index].name[0],
                                ),
                              ),
                              // menampilkan name
                              title: Text(contactsProvider.contact[index].name),
                              // menampilkan number
                              subtitle:
                                  Text(contactsProvider.contact[index].number),
                              trailing: SizedBox(
                                width: 60,
                                child: Row(
                                  children: [
                                    Expanded(
                                      // untuk edit kontak
                                      child: IconButton(
                                        onPressed: () {
                                          contactsProvider.editContacts(
                                            index,
                                            contactsProvider
                                                    .nameController.text =
                                                contactsProvider
                                                    .contact[index].name,
                                            contactsProvider
                                                    .numberController.text =
                                                contactsProvider
                                                    .contact[index].number,
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

                                    // untuk hapus kontak
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          contactsProvider
                                              .deleteContacts(index);
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
              )
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
