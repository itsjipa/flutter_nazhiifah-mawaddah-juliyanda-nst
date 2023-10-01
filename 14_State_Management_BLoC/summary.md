BLoc

1. Flutter BLoC adalah sebuah arsitektur state management yang bertujuan untuk memisahkan logic bisnis dari tampilan UI. Dalam BLoC, data dianggap sebagai Stream yang mengalir dari sumber data ke objek tampilan yang dimana ketika data diubah, objek tampilan akan diperbarui secara otomatis

2. Flutter BLoC menggunakan Stream untuk mengimplementasikan aliran data, yang memungkinkan untuk mengirim data yang berubah ke banyak objek tampilan secara efisien. Dalam ini berfungsi untuk menguji bisnis logic secara terpisah tanpa perlu mempengaruhi tampilannya, sehingga dapat memudahkan dalam melakukan testing

3. Cara kerja BLoC :
    - BLoC merupakan class yang bertugas memproses event dan mengubah state sesuai dengan event yang diterima, ketika event diterima, class BLoC akan memproses event tersebut dan menghasilkan perubahan state baru

    - Event berupa object yang mempresentasikan aksi yang dilakukan oleh pengguna atau perubahan pada data

    - State mempresentasikan data yang akan diubah sesuia dengan event yang diterima, setelah sebuah event diproses oleh BLoC, state akan diubah sesuai dengan logika bisnis pada class BLoC

    - UI akan merender ulang tampilan sesuai dengan state yang telah diubah

    - Sink dan Stream, pada BLoC biasanya state akan dikirimkan menggunkan sink dan stream dimana sink berfungsi untuk menerima input event sedangkan stream untuk mengirimkan output state ke UI

    