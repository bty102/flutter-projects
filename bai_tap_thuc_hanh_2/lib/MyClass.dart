class MyClass {
  String id = "";
  String name = "";
  int numberOfStudent = 0;

  MyClass(String id, String name, int numberOfStudent) {
    this.id = id;
    this.name = name;
    this.numberOfStudent = numberOfStudent;
  }

  String get getId => id;
  String get getName => name;
  int get getNumberOfStudent => numberOfStudent;
}
