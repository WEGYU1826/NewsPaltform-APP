// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/channel_model.dart';
import '../provider/indivsual_channel.dart/the_channel.dart';

// ignore: must_be_immutable
class ChannalCatagorie extends StatefulWidget {
  ChannalCatagorie({
    Key? key,
    required this.contentID,
  }) : super(key: key);
  String? contentID;

  @override
  State<ChannalCatagorie> createState() => _ChannalCatagorieState();
}

class _ChannalCatagorieState extends State<ChannalCatagorie> {
  List<Doc>? channelModels;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    channelModels = (await RemoteServiceChannel()
        .getChannelContentByID("627ccd8b57aa0050f4290352") as List<Doc>);
    if (channelModels != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return channalCatagories(context);
  }

  Widget channalCatagories(context) {
    return Flexible(
      child: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).accentColor,
                        offset: const Offset(0, 2),
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                      ),
                    ],
                    color: Theme.of(context).accentColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Text(
                      channelModels![index].newsType.toString(),
                      style: GoogleFonts.acme(
                        fontSize: 20.0,
                        color: selectedIndex == index
                            ? HexColor("#2E92EE")
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
