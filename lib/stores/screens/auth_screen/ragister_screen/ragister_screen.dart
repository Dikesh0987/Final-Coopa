import 'package:coopa/stores/helper/dailogs.dart';
import 'package:coopa/stores/screens/auth_screen/account_setup_screen/account_setup_screen.dart';
import 'package:coopa/stores/screens/auth_screen/ragister_screen/otp_verify.dart';
import 'package:coopa/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coopa/stores/services/auth_apis.dart';

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RagisterScreen extends StatefulWidget {
  const RagisterScreen({super.key});

  @override
  State<RagisterScreen> createState() => _RagisterScreenState();
}

class _RagisterScreenState extends State<RagisterScreen> {
  /// Handel google btn
  _handleGoogleBtnClick() async {
    // internet/wifi connection issue
    try {
      //checking internet connections ....
      await InternetAddress.lookup('google.com');

      // progress indicator ....
      CustomDialog.showProgressDialog(context);
      // Call google sign in function ....
      _signInWithGoogle().then((user) async {
        if (user != null) {
          // Stop progress indicator
          Navigator.pop(context);

          if ((await AuthAPI.storeExists())) {
            // show diog for allready exit user
            CustomDialog.showSnackBar(context, "This is email already exist");
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
    return await AuthAPI.auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightGrayClr,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: klightGrayClr,
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
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 45,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OtpVerify()));
              },
              color: Primary1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "CREATE ACCOUNT",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Primary1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "CONTINUE WiTH GOOGLE",
                style: TextStyle(color: Primary1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
