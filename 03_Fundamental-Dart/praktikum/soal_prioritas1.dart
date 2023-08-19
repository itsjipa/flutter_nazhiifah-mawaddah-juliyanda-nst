import 'dart:io';
import 'dart:math';

void main() {
  // Soal prioritas 1 poin 1 tentang menghitung luas dan keliling persegi dan persegi panjang

  // luas dan keliling persegi
  stdout.write("Masukkan nilai panjang sisi: ");
  int sisi = int.parse(stdin.readLineSync()!);

  // rumus luas persegi
  final int luasPersegi = sisi *= sisi;
  // rumus keliling persegi
  final int kelilingPersegi = 4 * sisi;

  print("Luas persegi adalah $luasPersegi ");
  print("Keliling persegi adalah $kelilingPersegi ");
  print('');
  // luas dan keliling persegi panjang
  stdout.write('Masukkan nilai panjang : ');
  int p = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan nilai lebar : ');
  int l = int.parse(stdin.readLineSync()!);

  // rumus luas persegi panjang
  final int luasPersegiPjg = p * l;
  // rumus keliling persegi panjang
  final int kelilingPersegiPjg = 2 * (p + l);

  print("Luas persegi panjang adalah $luasPersegiPjg ");
  print("Keliling persegi panjang adalah $kelilingPersegiPjg ");

  // Soal prioritas 1 poin 2 tentang Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart

  // keliling dan luas lingkaran
  stdout.write('Masukkan nilai jari - jari : ');
  int r = int.parse(stdin.readLineSync()!);

  // rumus luas lingkaran
  final double luas = pi * r * r;
  // rumus keliling lingkaran
  final double keliling = 2 * pi * r;

  print("Luas lingkaran adalah $luas");
  print("Keliling lingkaran adalah $keliling");
}
