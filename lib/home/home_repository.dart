import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepository {
  Stream<QuerySnapshot> getNoteStream() {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    return FirebaseFirestore.instance.collection('notes').where('createdBy', isEqualTo: userEmail).snapshots();
  }

  Future<void> deleteNote(String id) async {
    final snapshot = await FirebaseFirestore.instance.collection('notes').where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      doc.reference.delete();
    }
  }
}
