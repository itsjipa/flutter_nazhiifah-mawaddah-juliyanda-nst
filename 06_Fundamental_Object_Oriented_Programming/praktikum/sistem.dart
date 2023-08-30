import 'dart:io';

import 'dataBuku.dart';

class SistemToko {
  // properti dari sistem yang berisi list kosong
  List<DataBuku> buku = [];

  // method untuk menambahkan buku
  void tambahBuku(DataBuku dataBuku) {
    // mengecek kondisi jika id buku yang ditambahkan unik atau tidak
    if (buku.any((b) => b.id == dataBuku.id)) {
      // maka cetak pesan jika id buku yang ditambahkan sudah tersedia
      print("ID buku ${dataBuku.id} yang anda tambahkan sudah tersedia");
    } else {
      // maka tambahkan data buku ke dalam list buku
      buku.add(dataBuku);
      print("Berhasil menambahkan buku dengan id ${dataBuku.id}");
    }
    stdout.writeln();
  }

  // method untuk melihat list buku
  void lihatBuku() {
    // kondisi untuk mengecek apakah didalam buku ada isinya
    if (buku.isNotEmpty) {
      print("ID\tJudul\t\tPenerbit\tHarga\tKategori");

      // maka lakukan perulangan untuk setiap data buku di dalam buku
      for (DataBuku dataBuku in buku) {
        // mengecek kondisi jika panjang judul lebih besar daripada 8 atau panjang penerbit lebih besar 10
        if (dataBuku.judul.length >= 8 || dataBuku.penerbit.length >= 10) {
          // mengambil string dengan indeks awalnya 0 dan indeks akhirnya 8 lalu tambahkan ...
          dataBuku.judul = dataBuku.judul.substring(0, 8) + "...";
          dataBuku.penerbit = dataBuku.penerbit.substring(0, 8) + "...";
        }
        print(
            "${dataBuku.id}\t${dataBuku.judul}\t${dataBuku.penerbit}\t${dataBuku.harga}\t${dataBuku.kategori}");
        stdout.writeln();
      }
    } else {
      // maka cetak pesan bahwa list buku masih belum berisi
      print("Tidak ada buku disini");
    }
  }

  // method untuk menghapus dlist buku berdasarkan id
  void hapusBuku(int id) {
    // mengecek kondisi dimana jika buku yang idnya dicari tersedia didalam list
    if (buku.any((b) => b.id == id)) {
      // hapus buku dari list
      buku.removeWhere((b) => b.id == id);
      print("Menghapus buku dengan id $id");
    } else {
      // maka cetak pesan jika buku dengan id yang dicari tidak tersedia
      print("Buku yang anda pilih dengan id $id tidak terdapat di daftar");
    }
    stdout.writeln();
  }
}
