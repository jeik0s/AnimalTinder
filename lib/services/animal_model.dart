class AnimalModel{

  AnimalModel({required this.id, required this.name, required this.age, required this.sex, required this.province, required this.breed, required this.description, required this.photoUrl, required this.place});
  final String id;
  final String name;
  final String age;
  final String sex;
  final String province;
  final String breed;
  final String description;
  final String photoUrl;
  final String place;

  getId(){
    return id;
  }

  getName(){
    return name;
  }

  getAge(){
    return age;
  }

  getSex(){
    return sex;
  }

  getProvince(){
    return province;
  }

  getBreed(){
    return breed;
  }

  getDescription(){
    return description;
  }

  getPhotoUrl(){
    return photoUrl;
  }

  getPlace(){
    return place;
  }

}