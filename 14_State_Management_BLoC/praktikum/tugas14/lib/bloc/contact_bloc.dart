import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas14/model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBlocBloc extends Bloc<ContactBlocEvent, ContactBlocState> {
  List<Contacts> contacts = [];

  ContactBlocBloc() : super(ContactBlocInitial()) {
    on<AddContactEvent>((event, emit) {
      contacts.add(event.contacts);
      emit(ContactLoadedState(List.from(contacts)));
    });

    on<EditContactEvent>((event, emit) {
      contacts[event.index] = event.contacts;
      emit(ContactLoadedState(List.from(contacts)));
    });

    on<DeleteContactEvent>((event, emit) {
      contacts.removeAt(event.index);
      emit(ContactLoadedState(List.from(contacts)));
    });
  }

  Stream<ContactBlocState> mapEventToState(ContactBlocEvent event) async* {
    if (event is AddContactEvent) {
      contacts.add(event.contacts);
      yield ContactLoadedState(List.from(contacts));
    } else if (event is EditContactEvent) {
      contacts[event.index] = event.contacts;
      yield ContactLoadedState(List.from(contacts));
    } else if (event is DeleteContactEvent) {
      contacts.removeAt(event.index);
      yield ContactLoadedState(List.from(contacts));
    }
  }
}
