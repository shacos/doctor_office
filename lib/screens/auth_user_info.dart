import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUserInfoScreen extends StatefulWidget {
  const AuthUserInfoScreen({
    super.key,
    required this.userCreds,
  });

  final UserCredential userCreds;

  @override
  State<StatefulWidget> createState() {
    return _AuthUserInfoScreenState();
  }
}

class _AuthUserInfoScreenState extends State<AuthUserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Unfortunately there was no time to continue...',
        ),
      ),
    );
  }
}
