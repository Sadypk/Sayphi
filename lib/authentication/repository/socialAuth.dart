import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sayphi/authentication/model/faceBookUserDataModel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sayphi/authentication/repository/authRepo.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
class SocialAuth{

  static final auth = FirebaseAuth.instance;

  static Future<FbUserDataModel?> facebookAuth() async{

    final _fbInstance = FacebookAuth.instance;

    final LoginResult result = await _fbInstance.login(); // by the fault we request the email and the public profile
    if (result.status == LoginStatus.success) {
      return FbUserDataModel.fromJson(await _fbInstance.getUserData(
        fields: "email,picture.width(400),first_name,last_name",
      ));
    }else{
      return null;
    }
  }

  static Future<GoogleSignInAccount?> googleAuth() async{
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if(account != null){

        GoogleSignInAuthentication googleSignInAuthentication = await account.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
        );

        UserCredential? authCredential;
        try {
          authCredential = await auth.signInWithCredential(credential);

        } on FirebaseAuthException catch (e) {
          Snack.showError(title: 'Authentication Error', message: e.message);
        }

        if(authCredential != null){
          final idToken = await auth.currentUser!.getIdToken();
          await AuthRepo.loginWithToken(idToken);
        }

        return account;
      }else{
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<LoginResult?> faceBookAuth() async{
    print('here');
    final _fbInstance = FacebookAuth.instance;
    try {
      LoginResult account = await _fbInstance.login();
      if(account.status == LoginStatus.success){
        final AccessToken accessToken = account.accessToken!;
        AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);

        UserCredential? authCredential;
        try {
          authCredential = await auth.signInWithCredential(credential);

        } on FirebaseAuthException catch (e) {
          Snack.showError(title: 'Authentication Error', message: e.message);
        }

        if(authCredential != null){
          final idToken = await auth.currentUser!.getIdToken();
          await AuthRepo.loginWithToken(idToken);
        }
        print(authCredential);
        print(account);
        return account;
      }
      else{
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  static verifyOtp(String verificationId, String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    UserCredential? authCredential;
    try {
      authCredential = await auth.signInWithCredential(phoneAuthCredential);

    } on FirebaseAuthException catch (e) {
      Snack.showError(title: 'Authentication Error', message: e.message);
    }

    if (authCredential != null) {
      final idToken = await auth.currentUser!.getIdToken();
      await AuthRepo.loginWithToken(idToken);
    }

  }
}