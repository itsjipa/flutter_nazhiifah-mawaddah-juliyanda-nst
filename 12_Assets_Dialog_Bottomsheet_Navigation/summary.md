Assets

1. Assets adalah file yang di bundled dan di deployed bersamaan dengan aplikasi memiliki berbagai tipe seperti : JSON file, icons, images dan font files.

2. Kita menggunakan assets dengan mendaftarkannya terlebih dahulu dalam file pubspec.yaml dengan menggunakan karakter '/' untuk memasukkan semua assets yang berada di directory yang sama contoh,( assets/ ).

3. Image pada flutter mendukung format gambar seperti JPEG, WEbP, GIF, Animated Web, PNG, BMP, WBMP, dll yang dimana digunakan untuk menampilkan gambar dari folder assets, kalau kita menggunakan gambar yang terletak di dalam assets/projek kita bisa menggunakan 'Image.assets' atau bisa menggunakan 'Image.network untuk mendapatkan data image melalui internet dengan menggunakan link urlnya.

--------------------------------------------------------------

Dialog Bottom Sheet

1. AlertDialog digunakan untuk menginformasikan user tentang sebuah situasi, bisa digunakan untuk input dari user, membutuhkan helper method yaitu showDialog

2. Bottomsheet digunakan untuk membuat dialog yang muncul dari bawah layar pada aplikasi, menggunakan fungsi bawaan flutter yaitu showModalBottomSheet, membutuhkan dua properti, yaitu context dan builder

3. ada tiga tipe flutter bottomsheets yaitu :
    - standard bottom sheets digunakan untuk menampilkan konten tambahan tanpa membatasi user untuk berinteraksi dengan bagian utama dari aplikasi ketika halaman tersebut terlihat
    - modal bottom sheets digunakan untuk menampilkan data tambahan sekaligus membatasi user berinteraksi dengan bagian lain dari sebuah aplikasi
    - expanding bottom sheets digunakan untuk user mengakses standard bottom sheets dan informasi yang disajikan di bottom sheets

--------------------------------------------------------------

Flutter Navigation

1. Navigation digunakan untuk berpindah halaman dari satu halaman ke halaman yang lain

2. Navigation dasar :
    - Navigator.push() digunakan untuk pindah halaman
    - Navigator.pop() digunakan untuk kembali ke halaman sebelumnya
   
3. Navigation routes :
    - Navigator.pushNamed() digunakan untuk pindah halaman menggunakan routes yang dimana tiap halaman routes memiliki alamat
