import 'dart:io';

void main() {
  // Soal eksplorasi poin 1 tentang mencari kalimat atau kata yang palindrome atau bukan

  stdout.write('Masukkan kata atau kalimat : ');
  String kata = stdin.readLineSync()!;

  String rev = kata.split('').reversed.join('');

  if (kata == rev) {
    print(
        "kata $kata jika dibalik adalah $rev sehingga kata ini merupakan kata palindrom");
  } else {
    print(
        "kata $kata jika dibalik adalah $rev sehingga kata ini bukan kata palindrom");
  }

  // Soal eksplorasi poin 2 tentang mencari faktor dari sebuah bilangan yang dimasukkan

  stdout.write('Masukkan angka : ');
  int angka = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= angka; i++) {
    if (angka % i == 0) {
      print(i);
    }
  }
}
