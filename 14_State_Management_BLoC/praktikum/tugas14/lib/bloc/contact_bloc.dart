import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas14/model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBlocBloc extends Bloc<ContactBlocEvent, ContactBlocState> {
  ContactBlocBloc() : super(ContactInitial(contacts: [])) {
    on<AddContactEvent>((event, emit) {
      state.contacts.add(event.contacts);

      emit(ContactInitial(contacts: state.contacts));
    });

    on<EditContactEvent>((event, emit) {
      state.contacts[event.index] = Contacts(
        name: event.name,
        number: event.number,

      );

      emit(ContactInitial(contacts: state.contacts));
    });

    on<DeleteContactEvent>((event, emit) {
      state.contacts.removeAt(event.index);

      emit(ContactInitial(contacts: state.contacts));
    });
  }
}
