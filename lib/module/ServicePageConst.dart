// ignore_for_file: file_names, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Padding titleContent(String string) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Text(
      string,
      style: GoogleFonts.acme(
        color: HexColor("#2E92EE"),
        fontSize: 30.0,
      ),
    ),
  );
}

Divider divider() {
  return Divider(
    height: 0.0,
    thickness: 1.0,
    color: HexColor("#C0C0BE"),
  );
}

Image logoImage() {
  return Image.asset(
    "assets/images/light/logo.png",
    height: 70.0,
    width: 70.0,
    fit: BoxFit.cover,
  );
}

Center authLogo() {
  return Center(
    child: SizedBox(
      child: Image.asset(
        "assets/images/light/logo.png",
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
      // height: 200.0,
    ),
  );
}

Widget authDescription(String string) {
  return Text(
    string,
    textAlign: TextAlign.center,
    style: GoogleFonts.acme(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

BackdropFilter backdropFilter(BuildContext context, String string) {
  return BackdropFilter(
    filter: ImageFilter.blur(
      sigmaX: 5,
      sigmaY: 5,
    ),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(string),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
    ),
  );
}

IconButton leadingIcon(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    icon: Icon(
      Icons.arrow_back,
      color: HexColor("#0E0E0E"),
    ),
  );
}

Padding textButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SizedBox(
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              "UPDATE",
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Padding settingContent(BuildContext context, String str, Icon icon, String id) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, id);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                str,
                style: GoogleFonts.acme(
                  color: HexColor("#0E0E0E"),
                  fontSize: 20.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, id);
                },
                icon: icon,
              ),
            ],
          ),
          Divider(
            height: 0.0,
            thickness: 1.0,
            color: HexColor("#C0C0BE"),
          ),
        ],
      ),
    ),
  );
}

class EditText extends StatelessWidget {
  EditText({Key? key, required this.name}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          name!,
          style: GoogleFonts.acme(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
