import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Veri ekleme
  Future<void> insertItem(Map<String, dynamic> item) async {
    try {
      await _firestore.collection('tasks').add(item);
      print("Veri başarıyla eklendi!");
    } catch (e) {
      print("Veri ekleme hatası: $e");
    }
  }

  // Veri okuma
  Future<List<Map<String, dynamic>>> getItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();
      return querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        };
      }).toList();
    } catch (e) {
      print("Veri okuma hatası: $e");
      return [];
    }
  }

  // Veri güncelleme
  Future<void> updateItem(String id, Map<String, dynamic> updatedItem) async {
    try {
      await _firestore.collection('tasks').doc(id).update(updatedItem);
      print("Veri başarıyla güncellendi!");
    } catch (e) {
      print("Veri güncelleme hatası: $e");
    }
  }

  // Veri silme
  Future<void> deleteItem(String id) async {
    try {
      await _firestore.collection('tasks').doc(id).delete();
      print("Veri başarıyla silindi!");
    } catch (e) {
      print("Veri silme hatası: $e");
    }
  }
}
