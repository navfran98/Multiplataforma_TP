class User {
  final String id;
  final String email;
  final String name;
  final String lastName;
  String? contactEmail;
  String? genre;
  String? birthDate;
  String? phoneNumber;
  String? imageUrl; // this is FireStorage url to the image

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.lastName,
      this.genre,
      this.birthDate,
      this.phoneNumber,
      this.imageUrl,
      this.contactEmail});

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
        id: id,
        email: json['email'] as String,
        name: json['name'] as String,
        lastName: json['lastName'] as String,
        genre: json['genre'] as String?,
        birthDate: json['birthDate'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        imageUrl: json['imageUrl'] as String?,
        contactEmail: json['contactEmail'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastName': lastName,
      'genre': genre,
      'birthDate': birthDate,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'contactEmail': contactEmail
    };
  }

  @override
  String toString() {
    return 'User {\nid: $id, \nemail: $email, \nname: $name, \nlastName: $lastName, \ngenre: $genre, '
        '\nbirthDate: $birthDate, \nphoneNumber: $phoneNumber, \nimageUrl: $imageUrl\n, \ncontactEmail: $contactEmail\n}';
  }

  bool isCompleted() {
    //TODO: agregar imagen
    if (birthDate != null &&
        genre != null &&
        phoneNumber != null &&
        contactEmail != null) {
      return true;
    }
    return false;
  }
}
