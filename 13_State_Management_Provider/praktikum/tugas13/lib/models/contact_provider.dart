import 'package:flutter/material.dart';
import 'package:tugas13/models/contact.dart';

class ContactProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  int selectIndex = 0;

  final List<Contacts> _contact = [];
  List<Contacts> get contacts => _contact;

  void addContacts(String name, String number) {
    bool exists = _contact
        .any((element) => element.name == name || element.number == number);
    if (!exists) {
      _contact.add(
        Contacts(
          name: name,
          number: number,
        ),
      );
    } else {
      _contact[selectIndex].name = name;
      _contact[selectIndex].number = number;
    }
    notifyListeners();
  }

  void editContacts(int index, String name, String number) {
    _contact[index].name = name;
    _contact[index].number = number;
    notifyListeners();
  }

  void deleteContacts(int index) {
    _contact.removeAt(index);
    notifyListeners();
  }
}
