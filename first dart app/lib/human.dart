class Human {
  int _numberOfArms = 2;
  String? hairColor;
  double? height;
  double? weight;
  Human({
    String? hairColor,
    double? height,
    double? weight,
  }) {
    this.hairColor = hairColor;
    this.height = height;
    this.weight = weight;
  }
  void walk() {
    print("this human can walk");
  }

 set numberOfArms(int number) {
    this._numberOfArms = (number <= 2 && number >= 0) ? number : throw Exception("wrong number");
  }
  int get numberOfArms {
    return this._numberOfArms;
  }
}
