import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/Models/userDB.dart';
import 'package:my_app/Widget/auth.dart';

class FirebaseService {
  final String uid;

  FirebaseService({this.uid});

  Future createUserDatabase(context, name, email, uid, photoURL, docUID) async {
    await FirebaseFirestore.instance.collection("users").doc(docUID).set({
      "name": name,
      "email": email,
      "uid": uid,
      'profileImage': photoURL ?? " ",
    });
  }

  // user data from snapshots
  UserModel _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        uid: uid,
        name: snapshot.data()['name'],
        email: snapshot.data()["email"],
        profileImage: snapshot.data()["profileImage"]);
  }

  // get user doc stream
  Stream<UserModel> get userData {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
