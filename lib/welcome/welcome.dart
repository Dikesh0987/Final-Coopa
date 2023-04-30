import 'package:coopa/stores/screens/store_welcome_screen/store_welcome_screen.dart';
import 'package:coopa/users/screens/main_screen/main_screen.dart';
import 'package:coopa/users/screens/users_welcome_screen%20copy%203/users_welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
    final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    GoogleSignInAccount? googleUser = googleSignIn.currentUser;
    if (googleUser != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainScreen()));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Coopa',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Let\'s get started!',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Get Started'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => StoreWelcomeScreen()));
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Get Started'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => UsersWelcomeScreen()));
              },
            ),
            SizedBox(height: 32.0),
            // ElevatedButton(
            //   child: Text('Get Started'),
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //         context, MaterialPageRoute(builder: (_) => HomeScreen()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
