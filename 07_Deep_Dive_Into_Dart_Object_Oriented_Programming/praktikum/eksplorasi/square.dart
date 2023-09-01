import 'shape.dart';

class Square implements Shape {
  // properti untuk kelas square yaitu side
  final int side;

  // constructor dari kelas square
  Square(this.side);

  // override getarea method untuk menghitung luas persegi
  @override
  int getArea() {
    return side * side;
  }

  // override getperimeter method untuk menghitung keliling persegi
  @override
  int getPerimeter() {
    return 4 * side;
  }
}
