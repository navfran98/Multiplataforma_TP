import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';

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
  Map<String, dynamic>? activeVolunteering;
  List<String> favorites;
  bool profileCompleted;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.favorites,
    this.activeVolunteering,
    required this.profileCompleted,
    this.genre,
    this.birthDate,
    this.phoneNumber,
    this.imageUrl,
    this.contactEmail,
  });

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
        contactEmail: json['contactEmail'] as String?,
        profileCompleted: json['profileCompleted'] as bool,
        favorites: List<String>.from(json['favorites'] as List<dynamic>),
        activeVolunteering:
            json['activeVolunteering'] as Map<String, dynamic>?);
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
      'contactEmail': contactEmail,
      'profileCompleted': profileCompleted,
      'favorites': favorites,
      'activeVolunteering': activeVolunteering
    };
  }

  @override
  String toString() {
    return 'User {\nid: $id, \nemail: $email, \nname: $name, \nlastName: $lastName, \ngenre: $genre, '
        '\nbirthDate: $birthDate, \nphoneNumber: $phoneNumber, \nimageUrl: $imageUrl\n, \ncontactEmail: $contactEmail\n, \nprofileCompleted: $profileCompleted\n, \nfavorites: $favorites\n, \nactiveVolunteering: $activeVolunteering\n}';
  }

}
