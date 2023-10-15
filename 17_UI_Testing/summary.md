UI TESTING

1. UI Testing adalah pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. Di Flutter disebut juga widget testing sehingga pengujuan dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis.

2. Keuntungan melakukan UI Testing yaitu :
    - memastikan seluruh widget memberi tampilan yang sesuai
    - memastikan seluruh interaksi dapat diterima dengan baik
    - menjadi ketentuaan yang harus diikuti saat diperlukan perubahan pada widget

3. Melakukan UI Testing di flutter sebagai berikut :
    - package testing sudah ter-install ketika project dibuat, tetapi kita juga bisa install secara manual untuk memastikan
    - penulisan script testnya dilakukan pada folder test dan nama file di dalam folder test harus diikuti dengan _test.dart
    - tiap file berisi fungsi main() yang didalamnya bisa dituliskan scrip testing dan tiap skenario pengujian disebut test case
    - test case diawali dengan testWidgets
    - ketika ingin menjalankan testing kita bisa menggunakan perintah flutter test yang akan menjalankan seluruh file test yang dibuat, hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan dan pesan bahwa pengujian berhasil atau gagal


OUTPUT BUILD

1. Output build adalah file/berkas hasil keluaran dari project flutter kita, digunakan untuk merilis aplikasi, terdiri dari format APK atau AAB untuk android dan IPA untuk IOS

2. memiliki 3 mode build yaitu :
    - Mode debug, untuk pengujian selama proses development
    - Mode profile, untuk pengujian performa aplikasi
    - Mode release, untuk merilis aplikasi ke Google Play Store dan Stores android lainnya

3. Build APK, hanya dapat berjalan di Android, memiliki format .apk, dapat diinstall langsung pada perangkat android

4. Build IPA, hasil output yang hanya dapat berjalan di iOS, memiliki format .ipa, perlu melakukan pendaftaran di https://developer.apple.com/programs/, perintah ini hanya dapat dijalankan pada perangkat apple