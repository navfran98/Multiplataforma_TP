import 'package:cloud_firestore/cloud_firestore.dart';

class Volunteering {
  final String id;
  final String type; //TODO: esto podria ser una especie de enum
  final String title;
  final String purpose;
  final String detail;
  final GeoPoint location; //TODO: coordenadas geograficas
  final String address;
  final String requirements;
  final String disponibility;
  final Timestamp creationDate;
  final int vacancies;
  final String imageUrl;
  final List<String> pending;
  final List<String> accepted;

  Volunteering({
    required this.id,
    required this.type,
    required this.title,
    required this.purpose,
    required this.detail,
    required this.location,
    required this.address,
    required this.requirements,
    required this.disponibility,
    required this.creationDate,
    required this.vacancies,
    required this.imageUrl,
    required this.accepted,
    required this.pending,
  });

  factory Volunteering.fromJson(String id, Map<String, dynamic> json) {
    return Volunteering(
      id: id,
      type: json['type'] as String,
      title: json['title'] as String,
      purpose: json['purpose'] as String,
      detail: json['detail'] as String,
      location: json['location'] as GeoPoint,
      address: json['address'] as String,
      requirements: json['requirements'] as String,
      disponibility: json['disponibility'] as String,
      creationDate: json['creationDate'],
      vacancies: json['vacancies'] as int,
      imageUrl: json['imageUrl'] as String,
      accepted: List<String>.from(json['accepted'] as List<dynamic>),
      pending: List<String>.from(json['pending'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'purpose': purpose,
      'detail': detail,
      'location': location,
      'address': address,
      'requirements': requirements,
      'disponibility': disponibility,
      'creationDate': creationDate,
      'vacancies': vacancies,
      'imageUrl': imageUrl,
      'accepted': accepted,
      'pending': pending,
    };
  }
}
