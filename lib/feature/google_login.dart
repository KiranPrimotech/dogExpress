import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_options.dart';

class LoginManager {
  /// Google Login
  late final GoogleSignInAccount? googleUser;

  Future<User?> signInWithGoogle() async {
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

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      print("User Email --- ${user!.email}");
      return user;
    } catch (e) {
      // Get.snackbar("Google Login ", "Exception --- ${e}",
      //     backgroundColor: AppColors.black, colorText: AppColors.white);
    }
  }
}
