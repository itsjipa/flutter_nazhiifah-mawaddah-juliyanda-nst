import 'package:flutter/material.dart';

class Contacts extends ChangeNotifier {
  final List<Map<String, dynamic>> _contacts = [];
  List<Map<String, dynamic>> get contacts => _contacts;

  void addContacts(Map<String, dynamic> contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
