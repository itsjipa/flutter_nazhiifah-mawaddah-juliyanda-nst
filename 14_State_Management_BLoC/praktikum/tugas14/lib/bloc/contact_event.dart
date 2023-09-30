part of 'contact_bloc.dart';

abstract class ContactBlocEvent {}

class AddContactEvent extends ContactBlocEvent {
  final Contacts contacts;

  AddContactEvent(this.contacts);
}

class EditContactEvent extends ContactBlocEvent {
  final int index;
  final Contacts contacts;

  EditContactEvent(this.index, this.contacts);
}

class DeleteContactEvent extends ContactBlocEvent {
  final int index;

  DeleteContactEvent(this.index);
}
