import 'hewan.dart';
import 'mobil.dart';

void main() {
  // membuat instance dari hewan dengan bobot yang berbeda
  final Hewan kucing = Hewan(2.42);
  final Hewan dino = Hewan(22.92);
  final Hewan hamster = Hewan(6.50);
  final Hewan katak = Hewan(8.20);
  final Hewan ayam = Hewan(22.10);

  // membuat instance dari mobil dengan kapasitas 50 kg
  final Mobil mobil = Mobil(50.0);

  // menambahkan hewan ke dalam muatan mobil
  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(dino);
  mobil.tambahMuatan(hamster);
  mobil.tambahMuatan(katak);
  mobil.tambahMuatan(ayam);
}
