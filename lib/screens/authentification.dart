import 'package:flutter/material.dart';

import 'package:doctor_office/widgets/authentification_form.dart';
import 'package:doctor_office/widgets/social_button.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({
    super.key,
    required this.isLogin,
  });

  final bool isLogin;

  @override
  State<StatefulWidget> createState() {
    return _AuthentificationScreenState();
  }
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.25,
            width: screenWidth,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/main_logo.png',
              width: screenWidth * 0.25,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Text(
            widget.isLogin ? 'Sign In' : 'Sign Up',
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          AuthentificationForm(
            isLogin: widget.isLogin,
          ),
          SizedBox(height: screenHeight * 0.02),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forget the Password ?',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'or continue with',
            style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocialButton(
                imageName: 'facebook_logo',
                textContent: 'Facebook',
              ),
              SocialButton(
                imageName: 'google_logo',
                textContent: 'Google',
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.isLogin
                    ? 'Don’t have an account ?'
                    : 'Already got an account ?',
                style: textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => AuthentificationScreen(
                        isLogin: !widget.isLogin,
                      ),
                    ),
                  );
                },
                child: Text(
                  widget.isLogin ? 'Sign Up' : 'Sign In',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
