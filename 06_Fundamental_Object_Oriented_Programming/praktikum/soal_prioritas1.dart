import 'hewan.dart';
import 'mobil.dart';

void main() {
  // membuat instance dari hewan dengan bobot yang berbeda
  Hewan kucing = Hewan(2.42);
  Hewan dino = Hewan(22.92);
  Hewan hamster = Hewan(6.50);
  Hewan katak = Hewan(8.20);
  Hewan ayam = Hewan(22.10);

  // membuat instance dari mobil dengan kapasitas 50 kg
  Mobil mobil = Mobil(50.0);

  // menambahkan hewan ke dalam muatan mobil
  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(dino);
  mobil.tambahMuatan(hamster);
  mobil.tambahMuatan(katak);
  mobil.tambahMuatan(ayam);
}
