import 'package:flutter/material.dart';

// Custom dialog/snackbar utility class.
class CustomDialog {
  // Show a snackbar with the given message.
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Show a circular progress indicator in a dialog.
  static void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}