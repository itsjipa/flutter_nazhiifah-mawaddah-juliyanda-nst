import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:tugas11/screen/contact.dart';

class FormAdvance extends StatefulWidget {
  const FormAdvance({super.key});

  @override
  State<FormAdvance> createState() => _FormAdvanceState();
}

class _FormAdvanceState extends State<FormAdvance> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final List<Contact> _contacts = List.empty(growable: true);

  int selectIndex = 0;

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = Colors.black;
  PlatformFile? _selectedFile;

  Future<void> _openSelectedFile() async {
    if (_selectedFile != null) {
      final result = await OpenFile.open(_selectedFile!.path);
      if (result.type == ResultType.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal membuka file'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = result.files.first;
        _openSelectedFile();
      });
    }
  }

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
            children: <Widget>[
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
                    // form untuk nama
                    TextFormField(
                      controller: _namaController,
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

                    // form untuk nomor
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _nomorController,
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
                    const SizedBox(
                      height: 10,
                    ),

                    // form nampilin kalender
                    TextFormField(
                      controller: _dateController,
                      onTap: () async {
                        final selectDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2026),
                        );
                        setState(() {
                          if (selectDate != null) {
                            _dueDate = selectDate;
                            final String formatDate =
                                DateFormat('EEEE, dd MMMM yyyy')
                                    .format(selectDate);
                            _dateController.text = formatDate;
                            debugPrint(formatDate);
                          }
                        });
                      },
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                        labelText: 'Select Date',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // untuk pick color
                    const Text('Color'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: _currentColor,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Pick Color'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text('Pick Your Color'),
                                content: BlockPicker(
                                    pickerColor: _currentColor,
                                    onColorChanged: (color) {
                                      setState(() {
                                        _currentColor = color;
                                      });
                                    }),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Save'),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // pick file
                    const Text('Pick Files'),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _pickFile();
                        },
                        child: const Text('Pick and Open File'),
                      ),
                    )
                  ],
                ),
              ),

              // tombol submit
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var form = _formKey.currentState;
                    String name = _namaController.text.trim();
                    String nomor = _nomorController.text.trim();

                    if (form!.validate()) {
                      form.save();
                      setState(() {
                        bool existsContacts = _contacts.any((contact) =>
                            contact.nama == name || contact.nomor == nomor);
                        if (!existsContacts) {
                          _contacts.add(
                            Contact(nama: name, nomor: nomor),
                          );
                        } else {
                          _contacts[selectIndex].nama = name;
                          _contacts[selectIndex].nomor = nomor;
                        }
                        _namaController.clear();
                        _nomorController.clear();
                        _dateController.clear();
                        form.reset();
                      });
                    }
                    debugPrint(
                      "Nama : ${_namaController.text}\nNomor : ${_nomorController.text}\n Tanggal : ${_dueDate.toString()}\nColor : ${_currentColor.toString()}\nFile Name : ${_selectedFile.toString()}",
                    );
                    form.reset();
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 29.0,
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
                    return ListTile(
                      // profile name
                      leading: CircleAvatar(
                        child: Text(_contacts[index].nama[0]),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // list nama
                          Text(
                            _contacts[index].nama,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),

                          // list nomor
                          Text(
                            _contacts[index].nomor,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),

                          // list date
                          Text(
                            'Date : ${DateFormat('EEEE, dd MMMM yyyy').format(_dueDate)}',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              // list color
                              const Text(
                                'Color : ',
                                style: TextStyle(fontSize: 10),
                              ),
                              Container(
                                width: 10,
                                height: 12,
                                margin: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  color: _currentColor,
                                  shape: BoxShape.rectangle,
                                ),
                              )
                            ],
                          ),

                          // list file
                          Text(
                            'File Name : ${_selectedFile!.name}',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      trailing: SizedBox(
                        width: 49,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                _namaController.text = _contacts[index].nama;
                                _nomorController.text = _contacts[index].nomor;
                                setState(() {
                                  selectIndex = index;
                                });
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 17,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _contacts.removeAt(index);
                                });
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
