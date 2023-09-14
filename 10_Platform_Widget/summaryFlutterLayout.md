Flutter Layout

1. Layout digunakan untuk mengatur tata letak, yang dimana berbentuk sebuah widget yang mengatur widget lain didalamnya

2. Single-child Layout itu widget yang hanya bisa menampung satu widget sebagai anaknya dan kita harus memilihnya sesuai kebutuhan. Contohnya :
    - Container, digunakan untuk membuat sebuah kotak atau box, hanya dapat membungkus satu widget, memiliki properti seperti margin, padding dan border.
    - Center, digunakan untuk membuat widget berada di tengah halaman.
    - SizedBox, digunakan untuk mengatur lebar dan tinggi dari suatu widget yang ditampung, lebih sederhana daripada container.

3. Multi-child Layout itu widget yang bisa menerima lebih dari satu widget sebagai anaknya. Contohnya :
    - Column, digunakan untuk mengatur widgets secara vertikal tetapi tidak dapat di scroll, memiliki properti seperti crossAxisAlignment, mainAxisAlignment.
    - Row, sama seperti column tapi bedanya row mengatur widgets secara horizontal.
    - ListView, digunakan untuk membuat widgets dalam bentuk list yang bisa di scroll sesuai arah scroll yang kita tentukan.
    - GridView, digunakan untuk membuat widgets ke dalam bentuk galeri.