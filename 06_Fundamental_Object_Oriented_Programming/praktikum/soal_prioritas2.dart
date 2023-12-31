import 'dart:io';

import 'calculator.dart';
import 'course.dart';
import 'student.dart';

void main() {
  // membuat instance class dari calculator
  final Calculator calc = Calculator();

  // cetak hasil dari pemanggilan method
  calc.penjumlahan(10, 20);
  calc.pengurangan(90, 10);
  calc.perkalian(20, 7);
  calc.pembagian(120, 10);

  stdout.writeln();

  // membuat beberapa course
  final Course fisika = Course("Fisika", "Fisika Dasar");
  final Course olahraga = Course("Penjas", "Roll Depan");
  final Course seniBudaya = Course("Seni Budaya", "Melukis Alam");

  final Student freya = Student("Freya", "12");

  // menambahkan course 
  freya.tambahCourse(fisika);
  freya.tambahCourse(olahraga);

  // melihat isi dari course
  freya.lihatCourse();

  // menghapus course
  freya.hapusCourse(olahraga);

  // melihat isi course setelah dihapus
  freya.lihatCourse();

  // menambahkan course
  freya.tambahCourse(seniBudaya);

  // melihat isi course setelah ditambahkan
  freya.lihatCourse();
}
