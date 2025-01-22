import 'package:flutter/material.dart';

class CustomDialog {
  static void showAnimatedDialog(
      BuildContext context, String title, String message) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, //to allow click outside to dismiss dialog
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,   
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: ScaleTransition(
            //to animate the dialog
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
