import 'package:flutter/material.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Text('LA'),
      ),
    );
  }
}
