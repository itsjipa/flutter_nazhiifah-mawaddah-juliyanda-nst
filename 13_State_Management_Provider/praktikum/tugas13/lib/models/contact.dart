class Contacts {
  late String name;
  late String number;

  Contacts({required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
    };
  }

  Contacts.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    number = map['number'];
  }

  Contacts copyWith({required String name, required String number}) {
    return Contacts(name: this.name, number: this.number);
  }
}
