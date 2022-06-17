// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/Channel&Account/ChannelPage.dart';
import '../model/channel_model.dart';
import '../provider/ChanneContentl.dart';

class BuidChannelList extends StatefulWidget {
  BuidChannelList({Key? key, this.list}) : super(key: key);
  List? list;

  @override
  State<BuidChannelList> createState() => _BuidChannelListState();
}

class _BuidChannelListState extends State<BuidChannelList> {
  List<Doc>? channelModels;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    channelModels =
        (await RemoteServiceChannel().getChannelContent()) as List<Doc>;
    if (channelModels != null) {
      setState(() {
        isLoaded = true;
      });
    }
    print(channelModels![0].logo);
  }

  @override
  Widget build(BuildContext context) {
    return buidChannelList(context);
  }

  Widget buidChannelList(context) => SliverToBoxAdapter(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            primary: false,
            shrinkWrap: true,
            itemCount: channelModels?.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChannelPage.id);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).accentColor,
                              offset: const Offset(0, 3),
                              spreadRadius: 5.0,
                              blurRadius: 7.0,
                            ),
                          ],
                          // color: Theme.of(context).accentColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: Image.network(
                            channelModels![index].logo!,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      channelModels![index].name!,
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
        ),
      );
}
