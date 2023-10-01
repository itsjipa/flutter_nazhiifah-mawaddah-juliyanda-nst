class Contacts {
  late int? id;
  late String name;
  late String number;

  Contacts({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }

  Contacts.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    number = map['number'];
  }

  Contacts copyWith({int? id, required String name, required String number}) {
    return Contacts(id: this.id, name: this.name, number: this.number);
  }
}
