import 'dart:io';
import 'dart:math';

void main() {
  // Soal prioritas 2 poin 1 tentang sebuah piramid bintang
  int a, b, c, d;
  for (a = 1; a <= 9; a++) {
    // memberikan spasi
    for (b = 8; b >= a; b--) {
      stdout.write(" ");
    }
    // mencetak bintang dari kanan ke kiri
    for (c = 1; c <= a; c++) {
      stdout.write("*");
    }
    // mencetak bintang dari kiri ke kanan
    for (d = 1; d <= a - 1; d++) {
      stdout.write("*");
    }
    // memberikan baris baru atau enter pada kode
    stdout.writeln();
  }
  stdout.writeln();

  // Soal prioritas 2 poin 2 tentang Buatlah sebuah jam pasir

  // inisialisasi n untuk panjang dari hourglass
  int n = 9;
  // yang atas
  for (int i = 1; i <= n; i++) {
    // memberikan spasi
    for (int j = 1; j < i; j++) {
      stdout.write(" ");
    }
    // mencetak piramida terbalik
    for (int k = i; k <= n; k++) {
      stdout.write("0 ");
    }
    // mencetak baris baru
    stdout.writeln();
  }
  // yang bawah
  for (int i = n - 1; i >= 1; i--) {
    // membuat spasi
    for (int j = 1; j < i; j++) {
      stdout.write(" ");
    }
    // membuat piramida untuk yang bawah
    for (int k = i; k <= n; k++) {
      stdout.write("0 ");
    }
    // mencetak baris baru
    stdout.writeln();
  }
  stdout.writeln();

  // Soal prioritas 2 poin 3 tentang mencari nilai faktorial

  // inputan user
  stdout.write("Masukkan nilai : ");
  int nilai = int.parse(stdin.readLineSync()!);

  // inisialisasi
  int faktorial, i;

  faktorial = 1;
  for (i = 1; i <= nilai; i++) {
    faktorial = faktorial * i;
  }
  // menampilkan output
  print("$nilai! = $faktorial");
  stdout.writeln();

  // Soal prioritas 2 poin 4 tugas function tentang Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. kemudian function lingkaran tersebut dijalankan pada function main

  stdout.write('Masukkan nilai jari - jari : ');
  int jari = int.parse(stdin.readLineSync()!);

  double luas = luasLingkaran(jari);

  print("Luas lingkaran adalah $luas");
}

double luasLingkaran(int r) {
  return pi * r * r;
}
