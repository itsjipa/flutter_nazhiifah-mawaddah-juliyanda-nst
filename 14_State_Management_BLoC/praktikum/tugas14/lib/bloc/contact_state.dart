// import 'package:tugas14/model/contact.dart';

part of 'contact_bloc.dart';

abstract class ContactBlocState {
  List<Contacts> contacts;
  ContactBlocState({required this.contacts});
}

class ContactInitial extends ContactBlocState {
  ContactInitial({required List<Contacts> contacts})
      : super(contacts: contacts);
}
