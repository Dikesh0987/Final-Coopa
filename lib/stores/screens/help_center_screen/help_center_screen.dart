import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/style.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary0,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Help center ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                color: Colors.black,
                size: 20,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const FAQSection(
                  question: 'How do I create an account?',
                  answer:
                      'To create an account, click on the Sign Up button and fill in the required information.',
                ),
                const SizedBox(height: 10),
                const FAQSection(
                  question: 'How do I reset my password?',
                  answer:
                      'To reset your password, click on the Forgot Password link on the login page and follow the instructions.',
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'If you have any questions or need help, please contact us at storesupport@coopa.com',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FAQSection extends StatelessWidget {
  final String question;
  final String answer;

  const FAQSection({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
