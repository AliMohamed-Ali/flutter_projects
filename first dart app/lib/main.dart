void main() {
  Doctor ali = Doctor();
  ali
    ..recordAttend()
    ..checkTemp();
  // print(ali.checkTemp());
}

class Employee {
  void recordAttend() {
    print("attend");
  }
}

class Doctor extends Employee with Medical, SomeThings {}

class Nurse extends Employee with Medical {}

mixin Medical {
  void checkTemp() {
    print("10");
  }
}

mixin SomeThings {
  int giveMedican() {
    return 20;
  }
}
