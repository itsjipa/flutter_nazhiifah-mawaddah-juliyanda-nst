import 'matematika.dart';

class KelipatanPersekutuanTerkecil implements Matematika {
  // property pada class kelipatan persekutuan terkecil
  final int x;
  final int y;

  // constructor untuk kelas kelipatan persekutuan terkecil
  KelipatanPersekutuanTerkecil(this.x, this.y);

  // method untuk menghitung fpb dari dua bilangan
  int fpb(final int a, final int b) {
    // melakukan pengecekan jika b adalah 0
    if (b == 0) {
      // maka return nilai a sebagai fpb
      return a;
    } else {
      // maka panggil kembali dirinya sendiri dengan b sebagai sisa bagi dari a modulo b
      return fpb(b, a % b);
    }
  }

   // override method hasil untuk menghitung kelipatan persekutuan terkecil
  @override
  int hasil() {
    // ~/ (operator aritmatika untuk menghasilkan nilai integer dengan membuang sisa bagi)
    return (x * y) ~/
        fpb(x,
            y); // memanggil kembali fungsi fpb dan membaginya dengan hasil kali x dan y
  }
}