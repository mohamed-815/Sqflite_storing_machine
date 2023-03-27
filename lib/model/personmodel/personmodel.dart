class Person {
  int? id;
  String name;
  int age;
  String isMarried;
  String job;
  String place;

  Person(
      {this.id,
      required this.name,
      required this.age,
      required this.isMarried,
      required this.job,
      required this.place});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'isMarried': isMarried,
      'job': job,
      'place': place,
    };
  }

  static Person fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      isMarried: map['isMarried'],
      job: map['job'],
      place: map['place'],
    );
  }
}
