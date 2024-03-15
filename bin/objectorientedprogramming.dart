import 'dart:io';

abstract class Vehicle {
  void displayInfo();
}

class Car implements Vehicle {
  String brand;
  String model;

  Car(this.brand, this.model);

  @override
  void displayInfo() {
    print('Car: $brand $model');
  }

  void honk() {
    print('Honk Honk!');
  }
}

class ElectricCar extends Car {
  ElectricCar(super.brand, super.model);

  @override
  void displayInfo() {
    print('Electric Car: $brand $model');
  }
}

Car readCarFromFile(String filePath) {
  final file = File(filePath);
  final lines = file.readAsLinesSync();

  if (lines.length >= 2) {
    final brand = lines[0];
    final model = lines[1];
    return Car(brand, model);
  } else {
    throw Exception('Invalid file format');
  }
}

void printNumbers() {
  for (int i = 1; i <= 5; i++) {
    print('Number: $i');
  }
}

void main() {
  try {
    final car = readCarFromFile('car_data.txt');
    car.displayInfo();
  } catch (e) {
    print('Error reading file: $e');
  }

  final car1 = Car('Toyota', 'Corolla');
  final electricCar1 = ElectricCar('Tesla', 'Model S');

  car1.displayInfo();
  car1.honk();
  electricCar1.displayInfo();

  printNumbers();
}