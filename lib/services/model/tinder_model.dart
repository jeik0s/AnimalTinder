final String tableTinder = 'tabletinder';

class TinderFields {
  static final String id = '_id';
  static final String name = '_name';
  static final String age = '_age';
  static final String breed = '_breed';
  static final String description = '_description';
  static final String photoLink = '_photolink';
}

class TinderModel {
  final int? id;
  final String name;
  final int age;
  final String breed;
  final String description;
  final String photoLink;

  const TinderModel({
    this.id,
    required this.name,
    required this.age,
    required this.breed,
    required this.description,
    required this.photoLink
  });
}