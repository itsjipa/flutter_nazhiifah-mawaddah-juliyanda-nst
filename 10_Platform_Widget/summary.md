Platform Widget

1. MaterialApp adalah widget yang mengemas seluruh widget dalam aplikasi dan digunakan pada sistem android yang digunakan dengan cara mengimport package material.
    - Widget yang pertama kali dibuka diletakkan pada bagian home
    - Widget yang berfungsi untuk mengatur tema aplikasi, diletakkan pada theme
    - Mengatur halaman dapat dilakukan menggunakan routes dan initialRoute

2. Scaffold adalah widget dasar yang digunakan untuk membangun sebuah halaman pada MaterialApp dan membentuk tata letak dasar pada sebuah halaman yang ditulis melalui properti-properti seperti :
    - appBar, digunakan untuk bar menu pada bagian atas halaman
    - drawer, digunakan untuk membuat sebuah menu pada bagian samping yang diperuntukkan juga sebagai navigasi atau perpindahan halaman
    - body, digunakan untuk memuat content yang akan ditampilkan 
    - bottomNavigationBar, digunakan untuk menu bagian bawah halaman yang diperuntukkan juga sebagai navigasi atau perpindahan halaman
    - floatingActionButton, digunakan untuk membuat tombol yang melayang pada pojok kanan bawah dan bisa diperuntukkan juga sebagai navigasi


3. CuppertinoApp adalah widget yang mengemas seluruh widget dalam aplikasi dan digunakan pada sistem ios yang digunakan dengan cara mengimport package cupertino.
    - Variabel _themeDark dibuat untuk menyimpan tema. Hal ini diperlukan karena cuppertino tidak menyediakan ThemeData.dark() seperti pada Material
memiliki beberapa widget seperti :
    - CupertinoPageScaffold
    - CupertinoButton
    - CupertinoActionSheet
    - CupertinoActivityIndicator
    - CupertinoAlertDialog
    - CupertinoDatePicker
    - CupertinoDialog
    - CupertinoDialogAction
    - dll

4. CupertiniPageScaffold  widget dasar yang digunakan untuk membangun sebuah halaman pada CupertinoApp dan membentuk tata letak dasar pada sebuah halaman yang ditulis melalui properti-properti seperti :
    - backgroundColor, digunakan untuk membuat latar belakang dari CupertinoPageScaffold
    - child, berbeda dengan scaffold di cupertino kita menyebutnya child bukan body
    - navigationBar, ini berbeda dengan bottomNavigationBar di scaffold namun dia mirip dengan appBar dan menggunakan widget CupertinoNavigationBar
    - resizeToAvoidBottomInset