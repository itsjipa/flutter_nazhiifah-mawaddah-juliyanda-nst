void main() {
  List<String> sampel = [
    'amuse',
    'tommy kaira',
    'spoon',
    'Spoon',
  ];
  print(nilaiUnik(sampel));

  List<String> sample = [
    "js",
    "js",
    "JS",
    "golang",
    "python",
    "js",
    "js",
    "golang",
    "rust",
  ];
  print(hitungFrekuensi(sample));
}

// Soal eksplorasi poin 1 tentang menghilangkan nilai atau data yang sama
List<dynamic> nilaiUnik(List<String> data) {
  // menggulangi setiap elemen yang ada di data dan mengubahnya menjadi lowercase lalu menjadi set lalu kembali lagi menjadi list
  var ubah = data.map((e) => e.toLowerCase()).toSet().toList();
  // mereturn hasil iterasi
  return ubah;
}

// Soal eksplorasi poin 2 tentang  menghitung frekuensi pada setiap data dalam list
Map<String, int> hitungFrekuensi(List<String> data1) {
  // membuat set kosong untuk menampung hasil
  Map<String, int> hasil = {};
  for (final data in data1) {
    // mengembalikan nilai yang diperbarui, jika data ada yang baru akan disimpan ke hitung dan dijumlahkannya menjadi hitung+1 lalu jika dia tidak memiliki yang baru maka akan mengembalikan nilai ifabsent
    hasil.update(data.toLowerCase(), (hitung) => hitung + 1, ifAbsent: () => 1);
  }
  // mencetak iterasi hasil
  return hasil;
}
