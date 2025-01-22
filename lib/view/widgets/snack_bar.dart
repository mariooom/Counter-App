import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackBar(BuildContext context, String message) {
    //to add animation to snackbar
    final animationController = AnimationController(
      vsync: ScaffoldMessenger.of(context),
      duration: const Duration(seconds: 1),
    );

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        animation: curvedAnimation,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    animationController.forward(); //to initiate the animation
  }
}
