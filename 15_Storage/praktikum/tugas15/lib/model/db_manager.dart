import 'package:flutter/material.dart';
import 'package:tugas15/helper/database_helper.dart';
import 'package:tugas15/model/contact.dart';

class DbManager extends ChangeNotifier {
  List<Contacts> _contacts = [];
  late DatabaseHelper _databaseHelper;

  List<Contacts> get contacts => _contacts;

  DbManager() {
    _databaseHelper = DatabaseHelper();
    _getAllContacts();
  }

  void _getAllContacts() async {
    _contacts = await _databaseHelper.getContacts();
    notifyListeners();
  }

  Future<void> addContacts(Contacts contacts) async {
    await _databaseHelper.addContact(contacts);
    _getAllContacts();
  }

  Future<Contacts> getContactById(int id) async {
    return await _databaseHelper.getContactById(id);
  }

  void updateContacts(Contacts contacts) async {
    await _databaseHelper.updateContact(contacts);
    _getAllContacts();
  }

  void deleteContacts(int id) async {
    await _databaseHelper.deleteContact(id);
    _getAllContacts();
  }
}
