import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../note.dart';

class HomeRepository {
  Stream<QuerySnapshot> getNoteStream() {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    return FirebaseFirestore.instance.collection('notes').where('createdBy', isEqualTo: userEmail).snapshots();
  }

  Future<void> deleteNote(String id) async {
    final snapshot = await FirebaseFirestore.instance.collection('notes').where('id', isEqualTo: id).get();
    snapshot.docs.first.reference.delete();
  }

  String _generateUUID() {
    return const Uuid().v4();
  }

  void addNote(Note note) {
    final notesCollection = FirebaseFirestore.instance.collection('notes');
    final data = note.copyWith(id: _generateUUID()).toJson();
    data['createdBy'] = FirebaseAuth.instance.currentUser?.email;
    notesCollection.add(data);
  }

  Future<void> updateNote(Note note) async {
    final snapshot = await FirebaseFirestore.instance.collection('notes').where('id', isEqualTo: note.id).get();
    snapshot.docs.first.reference.update(note.toJson());
  }
}
