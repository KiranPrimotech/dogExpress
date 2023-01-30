import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_options.dart';

class GoogleLoginManager {
  /// Google Login
  late final GoogleSignInAccount? googleUser;

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      if (Platform.isAndroid) {
        googleUser = await GoogleSignIn(
                clientId:
                    DefaultFirebaseOptions.currentPlatform.androidClientId)
            .signIn();
      } else if (Platform.isIOS) {
        googleUser = await GoogleSignIn(
                clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
            .signIn();
      }
      Loader.show(context);
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
     // Loader.hide();

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      debugPrint("User Email --- ${user!.email}");
      return user;
    } catch (e) {
      Loader.hide();
      debugPrint("error  $e");
    }

  }
}
