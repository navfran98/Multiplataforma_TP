import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/utils/logger.dart';

abstract interface class VolunteeringDao {
  // Find user from ID
  Future<Volunteering?> findById({required String id});

  Future<List<Volunteering>> findAllVolunteerings();
}

class VolunteeringDaoImpl extends VolunteeringDao {
  final volunteeringCollection = 'volunteerings';

  // Constructor and Factory Constructor
  VolunteeringDaoImpl();
  factory VolunteeringDaoImpl.instance() => VolunteeringDaoImpl();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<List<Volunteering>> findAllVolunteerings() async {
    final volunteerings = await _firestoreInstance.collection(volunteeringCollection).get();
    final volunteeringsList =
        volunteerings.docs.map((e) => Volunteering.fromJson(e.id, e.data())).toList();
    return volunteeringsList;
  }

  @override
  Future<Volunteering?> findById({required String id}) async {
    final docVolunteering = _firestoreInstance.collection(volunteeringCollection).doc(id);
    final snapshot = await docVolunteering.get();
    if (snapshot.exists) {
      Volunteering aux = Volunteering.fromJson(id, snapshot.data()!);
      return aux;
    } else {
      return Future.value(null);
    }
  }
}
