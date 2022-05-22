// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingStructure extends StatelessWidget {
  const OnboardingStructure({
    Key? key,
    required this.logoImage,
    required this.imageURL,
    required this.heading,
    required this.subHeading,
  }) : super(key: key);

  final String? logoImage, imageURL, heading, subHeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              logoImage!,
            ),
          ),
          Center(
            child: Image.asset(
              imageURL!,
              height: 350,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          Text(
            heading!,
            textAlign: TextAlign.start,
            style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            subHeading!,
            textAlign: TextAlign.start,
            style: GoogleFonts.acme(
              fontSize: 30.0,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
