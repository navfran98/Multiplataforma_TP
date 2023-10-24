class Volunteering {
  final String type; //TODO: esto podria ser una especie de enum
  final String title;
  final String purpose;
  final String detail;
  final String location; //TODO: coordenadas geograficas
  final String address;
  final String requirements; //TODO: aca no entiendo porque dice markdown en la consigna
  final String creationDate;
  final int vacancies;


  Volunteering({
    required this.type,
    required this.title,
    required this.purpose,
    required this.detail,
    required this.location,
    required this.address,
    required this.requirements,
    required this.creationDate,
    required this.vacancies
  });


  factory Volunteering.fromJson(Map<String, dynamic> json) {
    return Volunteering(
      type: json['type'] as String, 
      title: json['title'] as String, 
      purpose: json['purpose'] as String, 
      detail: json['detail'] as String, 
      location: json['location'] as String, 
      address: json['address'] as String, 
      requirements: json['requirements'] as String, 
      creationDate: json['creationDate'] as String, 
      vacancies: json['vacancies'] as int
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'type': type,
      'title': title,
      'purpose': purpose,
      'detail': detail,
      'location': location,
      'address': address,
      'requirements': requirements,
      'creationDate':creationDate,
      'vacancies': vacancies
    };
  }

}