import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async{
  List people = [];

  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach( (document) {
    people.add(document.data());
  });

  await Future.delayed(const Duration(seconds: 3));

  return people;
}

Future<void> addPeople(String name) async{

  await db.collection("people").add({"name": name});

}
