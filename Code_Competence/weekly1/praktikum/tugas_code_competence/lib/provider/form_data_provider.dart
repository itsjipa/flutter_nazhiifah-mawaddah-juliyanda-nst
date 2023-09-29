import 'package:flutter/material.dart';
import 'package:tugas_code_competence/model/form_data.dart';

class FormDataProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final FormDatas _formData = FormDatas('', '', '', '');

  // getter method
  FormDatas get formData => _formData;

  final firstNameController = TextEditingController();
  final lasstNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void updateData(
      String firstname, String lastname, String email, String message) {
    _formData.firstname = firstname;
    _formData.lastname = lastname;
    _formData.email = email;
    _formData.message = message;
    notifyListeners();
  }
}
