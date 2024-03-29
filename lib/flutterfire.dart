
// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

Future<void> signIn(String email, String password) async {}
Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
         .createUserWithEmailAndPassword(email: email, password: password);
    return true;
   } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
     } else if (e.code == 'email already in use');
      print('The account already exists for that email.');
        
    }
    return false;
   } Catch (e) {
   print(e.toString());
    return false;
  }
