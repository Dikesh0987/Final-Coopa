import 'dart:io';

import 'package:coopa/users/helper/dailogs.dart';
import 'package:coopa/users/screens/auth_screen/account_setup_screen/account_setup_screen.dart';
import 'package:coopa/users/screens/auth_screen/login_screen/password_screen.dart';
import 'package:coopa/users/screens/main_screen/main_screen.dart';
import 'package:coopa/users/services/apis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coopa/theme/style.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Handel google btn
  _handleGoogleBtnClick() async {
    // catcj internet/wifi connection issue
    try {
      //checking internet connections ....
      await InternetAddress.lookup('google.com');

      // progress indicator ....
      CustomDialog.showProgressDialog(context);

      // Call google sign in function ....
      _signInWithGoogle().then((user) async {
        if (user != null) {
          // Get user Data from googlr
          print('\nUser : ${user.user}');
          print('\nUserAdditionalInfo : ${user.additionalUserInfo}');

          // Stop progress indicator
          Navigator.pop(context);

          if ((await APIs.userExists())) {
            //Redirect In Home page after succes fully Login
            APIs.getCurrentUserInfo().then((value) => APIs.updateActiveStatus(
                    true)
                .then((value) => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen()))
                    .then((value) => Navigator.pop(context))));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AccountSetupScreen()));
          }
        }
      });
    } catch (e) {
      print("_signInWithGoogle : $e");

      // Show no internrt connections msg in snackbar ....
      CustomDialog.showSnackBar(context, "No Internet/wifi Connection !");
      return null;
    }
  }

  // For Google Sign Oprations...
  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await APIs.auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary0,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        title: Text(
          "Coopa",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.black87,
                  size: 20,
                )),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter Your Email",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please create a secure password including the following criteria below.",
              style: TextStyle(
                  fontSize: 16, height: 1.5, color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Email",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              height: 45,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PasswordScreen()));
              },
              color: Primary1,
              child: Text(
                "CONTINUE",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Primary1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("OR"),
                ),
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Primary1,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 45,
              minWidth: double.infinity,
              onPressed: () {
              _handleGoogleBtnClick();
              },
              color: Colors.white,
              child: Text(
                "CONTINUE WiTH GOOGLE",
                style: TextStyle(color: Primary1),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
      ),
    );
  }
}
