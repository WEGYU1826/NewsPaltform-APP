// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'ChannalCatagories.dart';
import 'contConst.dart';

class ChannelDescription extends StatefulWidget {
  ChannelDescription({
    Key? key,
    required this.imageURl,
    required this.name,
    required this.id,
  }) : super(key: key);
  String? imageURl;
  String? name;
  String? id;

  @override
  State<ChannelDescription> createState() => _ChannelDescriptionState();
}

class _ChannelDescriptionState extends State<ChannelDescription> {
  bool subscribe = true;
  @override
  Widget build(BuildContext context) {
    return buildDescription(context, widget.imageURl!, widget.name!);
  }

  Widget buildDescription(context, String string, String name) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context)
                .scaffoldBackgroundColor
                .withOpacity(0.2), //begin color
            Theme.of(context)
                .scaffoldBackgroundColor
                .withOpacity(1), //end color
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Center(
              child: Image.network(
                string,
                fit: BoxFit.cover,
                height: 150.0,
                width: 150.0,
              ),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.acme(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                subscribe = !subscribe;
              });
            },
            child: subscribe
                ? subscription(context, "SUBSCRIBE", subscribe)
                : subscription(context, "UNSUBSCRIBE", subscribe),
          ),
          // ChannalCatagorie(contentID: widget.id),
        ],
      ),
    );
  }

  int selectedIndex_1 = 0;
  Widget subscription(BuildContext context, String string, bool bool) {
    return Container(
      decoration: BoxDecoration(
        color:
            bool ? HexColor("#2E92EE") : HexColor("#0E0E0E").withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.subscriptions_outlined,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 10.0),
            Text(
              string,
              style: GoogleFonts.acme(
                fontSize: 25.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
