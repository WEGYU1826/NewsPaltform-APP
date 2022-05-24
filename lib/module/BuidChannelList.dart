// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/Channel&Account/ChannelPage.dart';

class BuidChannelList extends StatefulWidget {
  BuidChannelList({Key? key, required this.list}) : super(key: key);
  List? list;

  @override
  State<BuidChannelList> createState() => _BuidChannelListState();
}

class _BuidChannelListState extends State<BuidChannelList> {
  @override
  Widget build(BuildContext context) {
    return buidChannelList(context, widget.list!);
  }

  Widget buidChannelList(context, list) => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ChannelPage.id);
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: Image.asset(
                        list[index].imagURL!,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        // color: Theme.of(context).primaryColor,
                        // colorBlendMode: BlendMode.color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    list[index].name!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.acme(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
