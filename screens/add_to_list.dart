import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddToList extends StatefulWidget {
  @override
  State<AddToList> createState() => _AddToListState();
}

class _AddToListState extends State<AddToList> {
  TextEditingController sebzeController = TextEditingController();
  TextEditingController meyveController = TextEditingController();
  TextEditingController temizlikController = TextEditingController();
  TextEditingController digerController = TextEditingController();

  CollectionReference items = FirebaseFirestore.instance.collection('items');

  // Firestore'dan veriyi yükleme
  Stream<QuerySnapshot> loadItems() {
    return items.snapshots();
  }

  // Firestore'a öğe ekleme
  Future<void> addItemToList() async {
    if (sebzeController.text.isNotEmpty) {
      setState(() {
        items.add({'title': 'Sebze: ${sebzeController.text}', 'completed': false});
      });
      sebzeController.clear();
    }

    if (meyveController.text.isNotEmpty) {
      setState(() {
        items.add({'title': 'Meyve: ${meyveController.text}', 'completed': false});
      });
      meyveController.clear();
    }

    if (temizlikController.text.isNotEmpty) {
      setState(() {
      items.add({'title': 'Temizlik: ${temizlikController.text}', 'completed': false});
      });
      temizlikController.clear();
    }

    if (digerController.text.isNotEmpty) {
      setState(() {
        items.add({'title': 'Diğer: ${digerController.text}', 'completed': false});
      });
      digerController.clear();
    }
  }

  // Firestore'dan öğe silme
  Future<void> removeItem(String docId) async {
    await items.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listeye Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: sebzeController,
              decoration: InputDecoration(
                hintText: 'Sebze',
                icon: Icon(Icons.food_bank),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: meyveController,
              decoration: InputDecoration(
                hintText: 'Meyve',
                icon: Icon(Icons.food_bank),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: temizlikController,
              decoration: InputDecoration(
                hintText: 'Temizlik',
                icon: Icon(Icons.cleaning_services),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: digerController,
              decoration: InputDecoration(
                hintText: 'Diğer',
                icon: Icon(Icons.add_circle_outline),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addItemToList,
              child: Text("Listeye Ekle"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: loadItems(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final item = docs[index];
                      return ListTile(
                        title: Text(item['title']),
                        leading: Checkbox(
                          value: item['completed'],
                          onChanged: (bool? value) {
                            items.doc(item.id).update({'completed': value});
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeItem(item.id), 
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
