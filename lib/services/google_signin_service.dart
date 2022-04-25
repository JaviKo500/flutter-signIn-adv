import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      final googleKey = await account?.authentication;
      print(' =======> id Token <==========');

      print(account);
      print(googleKey?.idToken);
      // TODO: Call rest service backend with id token
      return account;
    } catch (e) {
      print('Error google signin');
      print(e.toString());
      return null;
    }
  }
  static Future<GoogleSignInAccount?> signOut() async {
    await _googleSignIn.signOut();
  }

  

}