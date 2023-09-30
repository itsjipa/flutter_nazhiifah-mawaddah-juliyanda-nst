// import 'package:tugas14/model/contact.dart';

part of 'contact_bloc.dart';

abstract class ContactBlocState {}

final class ContactBlocInitial extends ContactBlocState {}

class ContactLoadedState extends ContactBlocState {
  final List<Contacts> contact;

  ContactLoadedState(this.contact);
}
