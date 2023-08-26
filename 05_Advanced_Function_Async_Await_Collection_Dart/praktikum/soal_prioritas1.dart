// Soal prioritas 1 tentang membuat sebuah fungsi dengan spesifikasi berikut:

void main() async {
  List<int> data = [2, 5, 3, 8, 5, 10];
  int pengali = 12;
  // memanggil fungsi dengan memasukkan dua parameter yaitu list data dan pengali
  print(await fungsiSpesifikasi(data, pengali));
}

Future<List> fungsiSpesifikasi(List<int> data, int angka) async {
  // membuat list kosong untuk mereturn hasil dari proses yang terjadi
  List hasil = [];
  // melakukan perulangan pada list data secara asynchronous
  for (int element in data) {
    // mengkalikan element list data dengan angka 
    var pengali = (data, angka) => data.map((element) => element * angka);
    // menunggu selama satu detik pada setiap perulangan
    await Future.delayed(Duration(seconds: 1), () {
      // memasukkan data yang berada pada pengali ke list hasil
      hasil.addAll(pengali([element], angka));
    });
  }
  // mengembalikan list baru yang berisi hasil perkalian antara list data dan angka
  return hasil;
}
