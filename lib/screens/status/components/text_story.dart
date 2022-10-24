import 'dart:io';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_whatsapp/screens/status/components/pages_liquid.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

import '../../../material/colors/mycolors.dart';

class TextStory extends StatefulWidget {
  const TextStory({Key? key}) : super(key: key);

  @override
  State<TextStory> createState() => _TextStoryState();
}

class _TextStoryState extends State<TextStory> {
  TextEditingController captionC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pageNow = 5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: false,
        bottom: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Material(
                  child: StatusWrite(
                pageNow: pageNow,
                changePage: (pageNow) {},
                captionC: captionC,
              )),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton(
                      backgroundColor: MyColor.greenWhatsApp,
                      onPressed: () async {
                        //Take ss and upload images
                        final controller = ScreenshotController();
                        final bytes =
                            await controller.captureFromWidget(MaterialApp(
                                debugShowCheckedModeBanner: false,
                                color: Colors.transparent,
                                home: StatusWrite(
                                  pageNow: liquidController.currentPage,
                                  captionC: captionC,
                                  changePage: (pageNow) {},
                                )));
                        final tempDir = await getTemporaryDirectory();
                        File file =
                            await File('${tempDir.path}/image.png').create();
                        file.writeAsBytesSync(bytes);

                        SocialShare.shareOptions(captionC.text,
                            imagePath: file.path);
                      },
                      child: const Icon(Icons.share_rounded),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusWrite extends StatefulWidget {
  const StatusWrite({
    Key? key,
    required this.captionC,
    required this.pageNow,
    required this.changePage,
  }) : super(key: key);

  final TextEditingController captionC;
  final int pageNow;
  final void Function(int) changePage;

  @override
  State<StatusWrite> createState() => _StatusWriteState();
}

LiquidController liquidController = LiquidController();
int pageNow = 4;

class _StatusWriteState extends State<StatusWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        LiquidSwipe(
            pages: pages,
            initialPage: widget.pageNow,
            liquidController: liquidController,
            onPageChangeCallback: widget.changePage),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
              child: TextField(
            clipBehavior: Clip.antiAlias,
            controller: widget.captionC,
            cursorHeight: 40,
            cursorRadius: const Radius.circular(30),
            cursorColor: Colors.white,
            cursorWidth: 2,
            enableInteractiveSelection: true,
            enableIMEPersonalizedLearning: true,
            maxLines: null,
            onChanged: (value) {
              setState(() {});
            },
            minLines: null,
            expands: false,
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Type a status",
              hintStyle: TextStyle(fontSize: 30, color: Colors.white38),
              border: InputBorder.none,
            ),
          )),
        ),
      ]),
    );
  }
}
