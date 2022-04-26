import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
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
      // print(' =======> id Token <==========');

      // print(account);
      // print(googleKey?.idToken);
      // TODO: Call rest service backend with id token
      final signInWithGoogleEndpoint = Uri(
        scheme: 'https',
        host: 'flutter-google-sign-in-jk.herokuapp.com',
        path: '/google'
      );
      final session = await http.post( 
        signInWithGoogleEndpoint,
        body: {
          'token': googleKey?.idToken
        }
      );
      print('==========> backend');
      print(session.body);
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