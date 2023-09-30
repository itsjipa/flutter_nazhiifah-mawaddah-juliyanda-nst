import 'package:flutter/material.dart';
import 'package:tugas13/models/contact.dart';

class ContactProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  int selectIndex = 0;

  final List<Contacts> _contact = [];
  List<Contacts> get contact => _contact;

  void addContacts(String name, String number) {
    bool exists = contact
        .any((element) => element.name == name || element.number == number);
    if (!exists) {
      contact.add(
        Contacts(
          name: name,
          number: number,
        ),
      );
    } else {
      contact[selectIndex].name = name;
      contact[selectIndex].number = number;
    }
    nameController.clear();
    numberController.clear();
    notifyListeners();
  }

  void editContacts(int index, String name, String number) {
    contact[index].name = name;
    contact[index].number = number;
    notifyListeners();
  }

  void deleteContacts(int index) {
    contact.removeAt(index);
    notifyListeners();
  }

  String? validatorNumber(String? value) {
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
  }

  String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi';
    }
    if (value.length < 2) {
      return "Nama harus memiliki minimal 2 kata";
    }
    if (value
        .split(' ')
        .every((element) => element[0] == element[0].toLowerCase())) {
      return 'Nama harus dimulai dengan huruf kapital';
    }
    if (value.contains(RegExp(r'[\d\W]'))) {
      return 'Nama tidak boleh mengandung angka dan karakter';
    }
    return null;
  }
}
