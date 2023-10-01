part of 'contact_bloc.dart';

abstract class ContactBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContactEvent extends ContactBlocEvent {
  final Contacts contacts;

  AddContactEvent(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class EditContactEvent extends ContactBlocEvent {
  final int index;
  final String name;
  final String number;

  EditContactEvent(this.index, this.name, this.number);

  @override
  List<Object> get props => [index, name, number,];
}

class DeleteContactEvent extends ContactBlocEvent {
  final int index;

  DeleteContactEvent(this.index);

  @override
  List<Object> get props => [index];
}
