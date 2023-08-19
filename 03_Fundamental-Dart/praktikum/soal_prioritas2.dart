import 'dart:io';
import 'dart:math';

void main() {
  // Soal prioritas 2 poin 1 tentang Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.

  // 3 string digabung
  var nama = 'Nazhiifah ';
  var namatengah = 'Mawaddah ';
  var namaakhir = 'Juliyanda ';

  print(nama + namatengah + namaakhir);
  print('');

  // Soal prioritas 2 poin 2 tentang Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.

  // volume tabung silinder
  stdout.write('Masukkan panjang jari - jari : ');
  int r = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan tinggi tabung : ');
  int h = int.parse(stdin.readLineSync()!);

  // rumus volume tabung silinder
  final double volume = pi * r * r * h;

  print("Hasil dari volume tabung silinder adalah $volume");
}
