Installation Command Line Interface and Package Management in Dart

1. Flutter CLI adalah alat yang digunakan untuk berinteraksi dengan flutter SDK, perintah ini dijalankan di terminal. Beberapa cli commands :
    - flutter clean, untuk menghapus folder build serta folder lainnya yang dihasilkan saat menjalankan emulator dan dapat memperkecil ukuran project
    - flutter run, untuk menjalankan project aplikasi di device yang tersedia
    - flutter pub, memiliki dua syntas yaitu add dan get dimana add digunakan untuk menambahkan packages ke depedencies yang berada di pubspec.yaml sedangkan get digunakan untuk menampilkan semua packages depedencies yang berada di pubspec.yaml
    - flutter build, untuk membuat atau memproduksi sebuah aplikasi untuk keperluan deploy atau publish

2. Packages Management adalah packages yang dibuat oleh developers lain untuk mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal dan dikarenakan flutter mendukung sharing packages, kita bisa mendapatkan packagesnya di website pub.dev

3. Kita bisa menambahkan packages dengan cara :
    - mencari packagesnya di website pub.dev
    - copy baris depedencies yang ada di bagian installing
    - buka pubspec.yaml
    - paste baris yang tadi dibawah depedencies
    - untuk make sure kita bisa run flutter pub get di terminal 
    - import package di file dart untuk digunakan
    - lalu jalankan emulator, kalok emulatornya sudah jalan ketika kita menambahkan depedencies bisa di stop dulu baru jalankan kembali