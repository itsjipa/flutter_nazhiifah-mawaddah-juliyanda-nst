Provider

1. Provider adalah salah satu library State Management pada flutter yang membantu dalam mengatur dan menyediakan data ke dalam widget yang membutuhkannya. Dengan mengunakan provider, kita bisa memisahkan antara tampila UI dari data aplikasi yang memungkinkan kita bisa mengakses data dari berbagai widget yang berbeda di dalam aplikasi, dengan menggunakan provider kita bisa menghindari penggunaan setState yang berlebihan

2. Provider dapat digunakan dalam beberapa cara tergantung kebutuhan aplikasi kita, salah satu cara yang paling sering digunakan adalah dengan menggunakan ChangeNotifierProvider, dimana ChangeNotifierProvider memudahkan kita dalam membuat dan mengelola instance dari class yang di-extend dengan changenotifier. Selain ChangeNotifier, Provider juga memiliki beberapa tipe lain seperti :  
    - ValueProvider digunakan untuk data yang sifatnya statis, 
    - StreamProvider digunakan untuk data yang sifatnya dinamis,
    - FutureProvider  digunakan untuk data yang akan datang atau sifatnya asynchronous

3. Dalam menggunakan Provider, kita perlu membuat sebuah instance class yang akan digunakan sebagai penyedia data, kemudian kita memasukkan instance tersebut ke dalam widget tree melalui ChangeNotifierProvider atau Provider sesuai dengan tipe data yang digunakan. setelahnya data tersebut dapat diakses melalui Consumer atau Provider.of 