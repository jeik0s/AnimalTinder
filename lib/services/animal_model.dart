class AnimalModel{

  AnimalModel({required this.name, required this.age, required this.sex, required this.province, required this.breed, required this.description, required this.photoUrl});
  final String name;
  final String age;
  final String sex;
  final String province;
  final String breed;
  final String description;
  final String photoUrl;

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

}