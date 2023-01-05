import 'package:flutter/material.dart';

const smallGap = SizedBox(
  height: 15,
);

const largeGap = SizedBox(
  height: 30,
);

extension ShowSnackBar on BuildContext {
  void shorwErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: Colors.red,
    ));
  }
}
