class Employee {
  late int id;
  late String name;
  late String surname;
  late int level;
  late String info;

  Employee.withId(int id, String name, String surname, int level, String info) {
    this.id = id;
    this.name = name;
    this.surname = surname;
    this.level = level;
    this.info = info;
  }
  Employee(String name, String surname, int level, String info) {
    this.name = name;
    this.surname = surname;
    this.level = level;
    this.info = info;
  }

  String get getInfo {
    String mesaj = '';
    if (this.level < 10) {
      mesaj = 'Junior';
    } else
      mesaj = 'Senior';

    return mesaj;
  }
}
