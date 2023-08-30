import 'hewan.dart';

class Mobil {
  // property untuk kapasitas total berat maksimum muatan
  final double kapasitas;

  // property yang menyimpan list data hewan dalam muatan
  final List<Hewan> muatan = [];

  // constructor untuk kelas mobil
  Mobil(this.kapasitas);

  // method yang digunakan untuk menambah data hewan ke list muatan
  void tambahMuatan(final Hewan hewan) {
    // kondisi untuk mengecek kapasitasnya udah mencukupi atau belum
    if (hewan.beratBadan + totalBeratMuatan() <= this.kapasitas) {
      // maka tambahkan hewan kedalam list muatan
      muatan.add(hewan);
      print("Anda berhasil menambahkan hewan");
    } else {
      // mencetak pesan untuk menandakan kapasitas muatan sudah melebihi batas maksimum
      print("Hewan yang anda tambahkan melebihi batas maksimum dari kapasitas");
    }
  }

  // method yang digunakan untuk menghitung berat dari muatan
  double totalBeratMuatan() {
    // inisialisasi untuk menyimpan total
    double total = 0.0;

    // perulangan untuk mengulangi setiap hewan di dalam list muatan
    for (final Hewan hewan in muatan) {
      // tambahkan berat badan hewan untuk dijumlahkan
      total += hewan.beratBadan;
    }
    // kembalikan total berat badan
    return total;
  }
}
