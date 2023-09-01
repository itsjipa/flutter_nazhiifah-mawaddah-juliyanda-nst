Deep Dive Into Dart Object Oriented Programming

1. Constructor adalah method yang dijalankan saat pembuatan object, dapat menerima parameter, tidak memiliki return dan namanya sama dengan nama class.

2. Inheritance adalah membuat class baru dengan memanfaatkan class yang sudah dibuat terlebih dahulu yang bertujuan agar sesuatu yang ada di class yang sudah dibuat dapat dimiliki oleh class yang baru. Bisa menggunakan extends.

3. Method overriding adalah menulis ulang method yang ada pada super classnya, bertujuan agar class memiliki method yang sama dengan proses yang berbeda. Melakukan overriding yaitu :
    - dilakukan pada class yang melakukan inheritance.
    - methodnya sudah ada pada class induk.
    - method ditulis ulang kayak membuat method baru pada class turunannya.
    - menambahkan tanda @override sebelum method dibuat

4. Interface yaitu berupa class yang menunjukkan method apa saja yang ada pada suatu class yang seluruh methodnya wajib di override dan digunakan dengan menggunakan implements. Menggunakan interface yaitu :
    - seperti inheritance
    - pada class yang melakukan implements wajib melakukan override di semua method yang ada pada class induknya

5. Abstract Class yaitu class abstrak yang menunjukkan method apa saja yang ada pada suatu class menggunakan extends yang tidak dapat dibuat object, dan tidak semua method harus di override

6. Polymorphism adalah kemampuan data berubah menjadi bentuk lain, menggunakan tipe data super class dan dapat dilakukan di class dengan extends atau implements

7. Generics bisa digunakan pada class atau fungsi, dapat memberi kemampuan agar dapat menerima data dengan tipe data yang berbeda, tipe datanya ditentukan saat membuat class atau menjalankan fungsi. Membuat class yaitu :
    - class dapat memasukkan data dengan tipe T.
    - tipe T dapat digunakan di seluruh class 

8. Enkapsulasi mempromosikan penyembunyian data, meningkatkan integritas data, memungkinkan perubahan pada suatu bagian kode tanpa memengaruhi bagian lain dan mengurangi kompleksitas dan potensi bug dalam kode

9. Modifikasi akses dalam dart :
    - kalok public dapat diakses dimana saja.
    - _privat membatasi akses dan hanya dalam perpustakaan atau kelas itu sendiri.
    - dart tidak memiliki kata kunci protected tetapi awalan _ menunjukkan akses terbatas

10. Getter dan Setter adalah metode yang memungkinkan akses terkontrol ke variabel privat dan memungkinkan enkapsulasi dengan menyediakan cara untuk membaca dan memodifikasi data privat, memastikan validasi atau perhitungan saat diperlukan