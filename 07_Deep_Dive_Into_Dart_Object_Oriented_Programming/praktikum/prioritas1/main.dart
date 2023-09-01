import 'balok.dart';
import 'kubus.dart';

// instance dari class kubus dan balok dengan sisi 20 dan panjang 20, lebar 10, tinggi 30
final Kubus bangun = Kubus(20);
final Balok balok = Balok(20, 10, 30);

void main() {
  // cetak volume menggunakan overridden method
  print("Volume kubus adalah ${bangun.volume()}");
  print("Volume Balok adalah ${balok.volume()}");
}
