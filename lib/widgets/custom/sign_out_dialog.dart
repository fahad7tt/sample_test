import 'package:flutter/material.dart';

class SignOutDialog extends StatelessWidget {
  final VoidCallback onSignOut;

  const SignOutDialog({super.key, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSignOut();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
