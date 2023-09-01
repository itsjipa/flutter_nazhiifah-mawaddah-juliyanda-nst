import 'dart:math';

import 'shape.dart';

class Circle implements Shape {
  // property dari class circle yaitu radius
  final int radius;

  // constructor dari kelas radius
  Circle(this.radius);

  // override getarea method untuk menghitung luas lingkaran
  @override
  int getArea() {
    return (pi * radius * radius).round();
  }

  // override getperimeter method untuk menghitung keliling lingkaran
  @override
  int getPerimeter() {
    return (2 * pi * radius).round();
  }
}
