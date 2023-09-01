import 'faktorPersekutuanTerbesar.dart';
import 'kelipatanPersekutuanTerkecil.dart';

final KelipatanPersekutuanTerkecil operation =
    KelipatanPersekutuanTerkecil(18, 12);
final FaktorPersekutuanTerbesar operasi = FaktorPersekutuanTerbesar(12, 18);

void main() {
  print("KPK dari ${operation.x} dan ${operation.y} adalah ${operation.hasil()}");
  print("FPB dari ${operasi.x} dan ${operasi.y} adalah ${operasi.hasil()}");
}
