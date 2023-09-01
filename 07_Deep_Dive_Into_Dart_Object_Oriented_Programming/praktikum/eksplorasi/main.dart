import 'circle.dart';
import 'square.dart';
import 'rectangle.dart';

// instance class untuk menampilkan 3 bangun datar
final Circle circle = Circle(20);
final Square square = Square(20);
final Rectangle rectangle = Rectangle(15, 20);

void main() {
   print(
      "Luas bangun datar lingkaran adalah ${circle.getArea()} yang memiliki keliling lingkaran dengan ${circle.getPerimeter()}");
  print(
     "Luas bangun datar persegi adalah ${square.getArea()} yang memiliki keliling persegi dengan ${square.getPerimeter()}");
  print(
      "Luas bangun datar segitiga adalah ${rectangle.getArea()} yang memiliki keliling segitiga dengan ${rectangle.getPerimeter()}");
}