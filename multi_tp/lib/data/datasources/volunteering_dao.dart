import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_tp/data/dtos/volunteering_dto.dart';
import 'package:multi_tp/utils/logger.dart';

abstract interface class VolunteeringDao {
  // Find user from ID
  Stream<Volunteering?> findById({required String id});

  Future<List<Volunteering>> findAllVolunteerings();

  Future<void> addPending({required String userId, required String volunteeringId});

  Future<void> deletePending({required String userId, required String volunteeringId});

  Future<void> addAccepted({required String userId, required String volunteeringId});

  Future<void> deleteAccepted({required String userId, required String volunteeringId});
}

class VolunteeringDaoImpl extends VolunteeringDao {
  final volunteeringCollection = 'volunteerings';

  // Constructor and Factory Constructor
  VolunteeringDaoImpl();
  factory VolunteeringDaoImpl.instance() => VolunteeringDaoImpl();

  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<List<Volunteering>> findAllVolunteerings() async {
    final volunteerings = await _firestoreInstance.collection(volunteeringCollection).get();
    final volunteeringsList =
        volunteerings.docs.map((e) => Volunteering.fromJson(e.id, e.data())).toList();
    return volunteeringsList;
  }

  @override
  Stream<Volunteering?> findById({required String id}) {
    final docVolunteering = _firestoreInstance.collection(volunteeringCollection).doc(id);
    return docVolunteering.snapshots().map((snapshot) {
      if (snapshot.exists) {
        return Volunteering.fromJson(id, snapshot.data()!);
      } else {
        return null;
      }
    });
  }

  @override
  Future<void> addPending({required String userId, required String volunteeringId}) async {
    final docVolunteering = _firestoreInstance.collection(volunteeringCollection).doc(volunteeringId);
    docVolunteering.update({'pending': FieldValue.arrayUnion([userId])});
  }

  @override
  Future<void> deletePending({required String userId, required String volunteeringId}) async {
    final docVolunteering = _firestoreInstance.collection(volunteeringCollection).doc(volunteeringId);
    docVolunteering.update({'pending': FieldValue.arrayRemove([userId])});
  }

  @override
  Future<void> addAccepted({required String userId, required String volunteeringId}) async {
    final docVolunteering = _firestoreInstance.collection(volunteeringCollection).doc(volunteeringId);
    docVolunteering.update({'accepted': FieldValue.arrayUnion([userId])});
  }

  @override
  Future<void> deleteAccepted({required String userId, required String volunteeringId}) async {
    final docVolunteering = _firestoreInstance.collection(volunteeringCollection).doc(volunteeringId);
    docVolunteering.update({'accepted': FieldValue.arrayRemove([userId])});
  }


}
