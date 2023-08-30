import 'dataBuku.dart';
import 'sistem.dart';

void main() {
  // instancedata buku
  DataBuku buku1 =
      DataBuku(1, "Galaksi Iiiii iiii", "Cocomelon", 129000, "Teen Fiction");
  DataBuku buku2 =
      DataBuku(2, "Dilan 1990", "Pidi Baiq", 85000, "Teen Fiction");
  DataBuku buku3 = DataBuku(3, "She Belongs to The Devil Prince",
      "Rumah Produksi kaca", 125000, "Teen Fiction");

  // instance sistem toko
  SistemToko sistemToko = SistemToko();

  // menambahkan buku1 kedalam sistem toko
  sistemToko.tambahBuku(buku1);
  sistemToko.tambahBuku(buku2);
  sistemToko.tambahBuku(buku3);

  // melihat isi dari sistem toko
  sistemToko.lihatBuku();

  // menghapus buku dengan id 3 dari dalam sistem toko
  sistemToko.hapusBuku(3);

  // melihat isi sistem toko setelah menghapus buku
  sistemToko.lihatBuku();
}
