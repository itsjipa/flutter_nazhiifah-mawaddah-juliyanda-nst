INTRODUCTION REST API

1. REST API (Representational State Transfer Apllication Programming Interface) adalah arsitektural yang memisahkan antara UI dengan proses bisnis yang berkirim data melalui HTTP Request

2. HTTP adalah protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web dimana pola komunikasinya ketika client mengirim request maka server akan mengolah dan membalas dengan memberi response, kita bisa menggunakan dio sebagai http client

3. Serealisasi JSON, mengubah struktur data ke bentuk JSON menggunakan fungsi Encode sedangkan deserialisasi JSON mengubah bentuk JSON ke struktur data

MVVM ARCHITECTURE

1. MVVM(Model-View ViewModel), memisahkan logic dengan tampilan ke dalam viewmodel. Keuntungannya : 
    - Reusability, jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama.
    - Maintainability, mudah dirawat karena task terkail tampilan tidak tertumpuk bersama logic.
    - Testability, pengujian dilakukan menjadi terpisah antara pengujian UI dan pengujian logic dehingga dapat meningkatkan produktivitas pada pengujian.

2. Kita bisa melakukam MVVM dengan membuat struktur direktori terlebih dahulu dengan : 
    - model memiliki 2 bagian yaitu bentuk data yang akan digunakan dan sumber dari data.
    - tiap screen diletakkan dalam direktori yang didalamnya terdapat view dan viewmodel

3. Model, dimana berisi bentuk data yang akan digunakan yang dibual dalam bentuk class, data yang akan dimuat diletakkan dalam property.
ViewModel, menyimpan data dan logic yang diperlukan