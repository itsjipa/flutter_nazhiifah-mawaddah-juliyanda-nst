import 'dart:io';

void main() {
  // Soal eksplorasi poin 1 tentang mengecek bilangan prima

  // Inputan untuk mengecek angka
  stdout.write("Masukkan angka: ");
  int angka = int.parse(stdin.readLineSync()!);

  // inisialisasi nilai bagi
  int bagi = 0;
  for (int i = 1; i <= angka; i++) {
    if (angka % i == 0) {
      bagi = bagi + 1;
    }
  }

  // pengecekan bilangan prima
  if (bagi == 2) {
    print("$angka merupakan bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
  stdout.writeln();

  // Soal eksplorasi poin 2 tentang tabel perkalian
  stdout.write("masukkan jumlah perkalian : ");
  int angka1 = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= angka1; i++) {
    for (int j = 1; j <= angka1; j++) {
      stdout.write("${i * j } ");
    }
    stdout.writeln();
  }
}
