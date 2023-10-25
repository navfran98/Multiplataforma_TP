class User {
  final String id;
  final String email;
  final String name;
  final String lastName;
  final String? genre;
  final String? birthDate;
  final String? phoneNumber;
  final String? imageUrl; // this is FireStorage url to the image


  User({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    this.genre,
    this.birthDate,
    this.phoneNumber,
    this.imageUrl,
  });

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
      id: id,
      email: json['email'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      genre: json['genre'] as String,
      birthDate: json['birthDate'] as String,
      phoneNumber: json['phoneNumber'] as String,
      imageUrl: json['imageUrl'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'name': name,
      'lastName': lastName,
      'genre': genre,
      'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl
    };
  }

}