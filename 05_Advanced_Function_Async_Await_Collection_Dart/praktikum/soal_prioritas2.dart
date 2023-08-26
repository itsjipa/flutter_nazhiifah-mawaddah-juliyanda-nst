void main() async {
  List<List<String>> sample = [
    ["andi", "cook"],
    ["rudi", "draw"],
    ["budi", "play"]
  ];
  // mencetak 2 sub-elemen dari list
  print(listToMap(sample));

  List<double> sampel = [2.3, 2, 5, 6, 8.19, 7, 10];
  // mencetak mean dari sebuah list
  print(mean(sampel));

  // mencetak faktorial secara asinkronus
  print(await faktorial(20));
}

// Soal prioritas 2 poin 1 tentang membuat list dengan spesifikasi
Map listToMap(List<List<String>> data) {
  final convertMap =
  // untuk mereturn key dan value dari list data
      Map.fromIterable(data, key: (i) => i[0], value: (i) => i[1]);
  // mencetak hasil dari konversi list ke map
  return convertMap;
}

// Soal prioritas 2 poin 2 tentang menghitung rata-rata dari sekumpulan nilai.
int mean(List<double> nilai) {
  // jika listnya kosong maka akan
  if (nilai.isEmpty) {
    // mencetak angka 0
    return 0;
  } else {
    double jumlah = 0;
    // perulangan untuk menghitung penjumlahan dari element didalam nilai
    for (double element in nilai) {
      jumlah += element;
    }
    // dan membaginya dengan panjang dari list nilai
    double mean = jumlah / nilai.length;
    // mereturn hasil penjumlahan dan membulatkannya keatas
    return mean.ceil();
  }
}

// Soal prioritas 2 poin 3 tentang melakukan perhitungan bilangan faktorial secara asinkron
Future<int> faktorial(int angka) async {
  // jika angka adalah 0 atau 1
  if (angka == 0 || angka == 1) {
    // mencetak angka 1
    return 1;
  } else {
    // menunggu proses rekursif yaitu memanggil fungsi dengan parameternya angka-1 dan akan berhenti ketika hasil = 1
    int hasil = await faktorial(angka - 1) * angka;
    // mencetak hasil dari proses rekursif
    return hasil;
  }
}
