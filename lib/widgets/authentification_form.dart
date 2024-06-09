import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:doctor_office/screens/auth_user_info.dart';

final _firebase = FirebaseAuth.instance;

class AuthentificationForm extends StatefulWidget {
  const AuthentificationForm({
    super.key,
    required this.isLogin,
  });

  final bool isLogin;

  @override
  State<StatefulWidget> createState() {
    return _AuthentificationFormState();
  }
}

class _AuthentificationFormState extends State<AuthentificationForm> {
  final _form = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isAuthenticating = false;

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) return;

    _form.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      final userCredentials;
      if (widget.isLogin) {
        userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
      }

      if (!context.mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => AuthUserInfoScreen(
            userCreds: userCredentials,
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed.'),
        ),
      );

      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _form,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16, horizontal: screenWidth * 0.05),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: textTheme.titleLarge,
                hintText: 'Email',
                hintStyle:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.secondary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: colorScheme.error),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@')) {
                  return 'invalid email';
                }
                return null;
              },
              onSaved: (newValue) => _enteredEmail = newValue!,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16, horizontal: screenWidth * 0.05),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: textTheme.titleLarge,
                hintText: 'Password',
                hintStyle:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.secondary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: colorScheme.error),
                ),
              ),
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty || value.length < 6) {
                  return 'password must be at least 6 character long';
                }
                return null;
              },
              onSaved: (newValue) => _enteredPassword = newValue!,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: screenWidth * 0.4),
              backgroundColor: colorScheme.primary,
            ),
            child: Text(
              widget.isLogin ? 'Sign In' : 'Sign Up',
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.surface),
            ),
          ),
        ],
      ),
    );
  }
}
