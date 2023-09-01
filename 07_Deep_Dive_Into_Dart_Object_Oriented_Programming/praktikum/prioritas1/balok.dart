import 'bangunRuang.dart';

class Balok extends BangunRuang {
  // constructor untuk kelas balok
  Balok(super.panjang, super.lebar, super.tinggi);

  // verride untuk metode volume di class bangun ruang untuk menghitung volume balok
  @override
  int volume() {
    // rumus menghitung volume balok
    return panjang * lebar * tinggi;
  }
}
