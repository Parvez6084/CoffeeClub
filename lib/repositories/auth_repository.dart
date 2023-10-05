import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';


class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final User? user = _firebaseAuth.currentUser;
      print('>>>>>>>>>>>$user');
      await _firebaseAuth.signInWithCredential(credential);
      if (user != null ) {

        await storeUserInFireStore(user);
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> storeUserInFireStore(User user) async {
    final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    final existingUserDoc = await usersCollection.doc(user.uid).get();
    if (!existingUserDoc.exists) {
      await usersCollection.doc(user.uid).set({
        'displayName': user.displayName,
        'email': user.email,
        'photoUrl': user.photoURL,
      });
    }
  }

  final DatabaseReference messageRef = FirebaseDatabase.instance.ref().child('messages');

  void sendMessage(String text, String senderId) {
    final newMessageRef = messageRef.push();
    newMessageRef.set({
      'text': text,
      'senderId': senderId,
      'timestamp': ServerValue.timestamp,
    });
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}