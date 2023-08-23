import 'dart:io';

void main() {
  // Soal prioritas 1 poin 1 tentang percabangan

  // Masukkan nilai
  stdout.write("Masukkan nilai angka : ");
  int nilai = int.parse(stdin.readLineSync()!);

  // Percabangan untuk mencari kondisi nilai yang di input
  if (nilai > 70) {
    print("Nilai A"); 
  } else if (nilai > 40) {
    print("Nilai B");
  } else if (nilai > 0) {
    print("Nilai C");
  } else {
    print("");
  }
  stdout.writeln();


  // Soal prioritas 1 poin 2 tentang perulangan

  // Menampilkan angka 1 sampai 10
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}