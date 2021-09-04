import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseGoogleSignIn {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String userName = "";

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      final user = _auth.currentUser;
      if (user != null) {
        userName = user.displayName.toString();
        print(user.displayName.toString());
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e);
    }
    return userName;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
