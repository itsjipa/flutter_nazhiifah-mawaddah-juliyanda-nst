import 'matematika.dart';

class FaktorPersekutuanTerbesar implements Matematika {
  // properti untuk faktor persekutuan terbesar
  final int x;
  final int y;

  // constructor untuk kelas faktor persekutuan terbesar
  FaktorPersekutuanTerbesar(this.x, this.y);

  // method untuk menghitung fpb dari dua bilangan
  int fpb(final int a, final int b) {
    // melakukan pengecekan jika b adalah 0
    if (b == 0) {
      // maka return a sebagai nilai fpb
      return a;
    } else {
      // maka panggil kembali dirinya sendiri dengan b sebagai sisa bagi dari a modulo b
      return fpb(b, a % b);
    }
  }

  // override method hasil untuk menghitung faktor persekutuan terbesar
  @override
  int hasil() {
    // mereturn nilai a yang berada pada fungsi fpb
    return fpb(x, y);
  }
}
