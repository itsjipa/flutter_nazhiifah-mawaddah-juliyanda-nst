import 'bangunRuang.dart';

class Kubus extends BangunRuang {
  // property untuk kubus yaitu sisi
  final int sisi;

  // constructor untuk class kubus
  Kubus(this.sisi) : super(sisi, sisi, sisi);

  // override untuk metode volume di class bangun ruang untuk menghitung volume kubus
  @override
  int volume() {
    // rumus volume kubus
    return sisi * sisi * sisi;
  }
}
