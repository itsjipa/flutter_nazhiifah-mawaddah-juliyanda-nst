import 'shape.dart';

class Rectangle implements Shape {
  // property dari kelas rectangle yaitu width dan height
  final int width;
  final int height;

  // constructor dari kelas rectangle
  Rectangle(this.width, this.height);

  // override getarea method untuk menghitung luas segitiga
  @override
  int getArea() {
    return width * height;
  }

  // override getperimeter method untuk menghitung keliling lingkaran
  @override
  int getPerimeter() {
    return 2 * (width + height);
  }
}
