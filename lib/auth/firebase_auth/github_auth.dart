// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// https://firebase.flutter.dev/docs/auth/social/#github
Future<UserCredential?> githubSignInFunc() async {
  // Create a new provider
  final githubProvider = GithubAuthProvider();

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithPopup(githubProvider);
}
