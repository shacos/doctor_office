import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.imageName,
    required this.textContent,
  });

  final String imageName;
  final String textContent;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: screenWidth * 0.03,
          right: screenWidth * 0.15,
        ),
      ),
      icon: Image.asset(
        'assets/images/$imageName.png',
        width: screenWidth * 0.08,
        fit: BoxFit.contain,
      ),
      label: Text(
        textContent,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
