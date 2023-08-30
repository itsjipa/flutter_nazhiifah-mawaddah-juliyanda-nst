import 'dart:io';

import 'course.dart';

class Student {
  // membuat atribut dari kelas student yaitu nama, kelas dan daftar course
  String nama;
  String kelas;

  // inisialisasi daftar course dengan list kosong
  final List<Course> dftrCourse = [];

  Student(this.nama, this.kelas);

  // method untuk menambah course 
  void tambahCourse(Course course) {
    // menambahkan course kedalam list daftar course
    dftrCourse.add(course);
  }

  //  method untuk menghapus course 
  void hapusCourse(Course course) {
    // menghapus course dari list daftar course
    dftrCourse.remove(course);
  }

  // method untuk melihat isi dari course
  void lihatCourse() {
    // mengecek kondisi jika dalam list daftar course ada isinya
    if (dftrCourse.isNotEmpty) {
      print("Course dengan nama $nama yang ada di kelas $kelas");
      
      // maka lakukan perulangan untuk mencetak semua course yang ada didalam list daftar course dalam
      for (final Course course in dftrCourse) {
        print(course.judul + ": " + course.deskripsi);
      }

      // memberikan line baru
      stdout.writeln();
    } else {
      // maka cetak pesan untuk pemberitahuan belum ada course yang ditambahkan
      print("Anda belum menambahkan course apapun");
    }
  }
}
