import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:intl/intl.dart';
import '../../../material/colors/mycolors.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);
  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  List akun = [];
  @override
  void initState() {
    jsonData();
    super.initState();
  }

//Read json file
  jsonData() {
    rootBundle.loadString('assets/json/list_chats.json').then((value) {
      final data = json.decode(value);
      setState(() {
        akun = data;
      });
    });
  }

  // The controller for the text field
  final TextEditingController _controller = TextEditingController();

  // This function is triggered when the clear buttion is pressed
  void _clearTextField() {
    // Clear everything in the text field
    _controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  String myMessage = '';

  int totalMyMessage = 0;
  List chatku = [];
  bool mute = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: MyColor.greenWhatsApp,
      color: Colors.white,
      onRefresh: () async {
        setState(() {
          jsonData();
        });

        Future.delayed(const Duration(seconds: 1))
            .whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: MyColor.greenWhatsApp,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                        textAlign: TextAlign.center,
                        '${akun.length} chat telah di perbaharui'),
                    duration: const Duration(seconds: 2),
                  ),
                ));
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: akun.isEmpty
            ? ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height / 3),
                    child: const Center(
                      child: Text(
                        'No Message',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                padding: EdgeInsets.only(
                    top: 10, bottom: MediaQuery.of(context).padding.bottom),
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                addAutomaticKeepAlives: true,
                clipBehavior: Clip.antiAlias,
                itemCount: akun.length,
                itemBuilder: (context, index) {
                  final item = akun[index];
                  final deletedName = akun[index]["name"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 3),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(18),
                      child: Slidable(
                        key: Key(item.toString()),
                        direction: Axis.horizontal,
                        endActionPane: ActionPane(
                            extentRatio: .18,
                            motion: const StretchMotion(),
                            children: [
                              // child:

                              //Arsip Icon
                              // CustomSlidableAction(
                              //   flex: 2,
                              //   autoClose: true,
                              //   padding: const EdgeInsets.symmetric(
                              //       vertical: 15, horizontal: 0),
                              //   onPressed: (context) {
                              //     ScaffoldMessenger.of(context)
                              //         .showSnackBar(SnackBar(
                              //       backgroundColor: MyColor.greenWhatsApp,
                              //       elevation: 3,
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(30)),
                              //       behavior: SnackBarBehavior.floating,
                              //       // ignore: prefer_const_constructors
                              //       content: Text(
                              //           textAlign: TextAlign.center,
                              //           "Archive is not available right now"),
                              //       clipBehavior: Clip.antiAlias,
                              //       duration: const Duration(seconds: 1),
                              //     ));
                              //   },
                              //   backgroundColor: Colors.green.shade800,
                              //   foregroundColor: Colors.white,
                              //   child: SingleChildScrollView(
                              //     clipBehavior: Clip.antiAlias,
                              //     physics: const BouncingScrollPhysics(),
                              //     scrollDirection: Axis.horizontal,
                              //     child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         SvgPicture.asset(
                              //           "assets/icons/ic_slideadble_arsip.svg",
                              //           color: const Color(0xFFF3F4F8),
                              //         ),
                              //         const Spacer(),
                              //         const Text('Archive',
                              //             style: TextStyle(
                              //               fontFamily: 'Helvetica',
                              //               fontSize: 14,
                              //               color: Color(0xFFF3F4F8),
                              //             ))
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // //Mute Icon
                              // CustomSlidableAction(
                              //   flex: 2,
                              //   autoClose: true,
                              //   padding: const EdgeInsets.symmetric(
                              //       vertical: 15, horizontal: 0),
                              //   onPressed: (context) {
                              //     ScaffoldMessenger.of(context)
                              //         .showSnackBar(SnackBar(
                              //       backgroundColor: MyColor.greenWhatsApp,
                              //       elevation: 3,
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(30)),
                              //       behavior: SnackBarBehavior.floating,
                              //       // ignore: prefer_const_constructors
                              //       content: Text(
                              //           textAlign: TextAlign.center,
                              //           "Mute is not available right now"),
                              //       clipBehavior: Clip.antiAlias,
                              //       duration: const Duration(seconds: 1),
                              //     ));
                              //   },
                              //   backgroundColor: Colors.amber.shade800,
                              //   foregroundColor: Colors.white,
                              //   child: SingleChildScrollView(
                              //     clipBehavior: Clip.antiAlias,
                              //     physics: const BouncingScrollPhysics(),
                              //     scrollDirection: Axis.horizontal,
                              //     child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         SvgPicture.asset(
                              //           "assets/icons/ic_slideadble_mute.svg",
                              //           color: const Color(0xFFF3F4F8),
                              //         ),
                              //         const Spacer(),
                              //         const Text('Mute',
                              //             style: TextStyle(
                              //               fontFamily: 'Helvetica',
                              //               fontSize: 14,
                              //               color: Color(0xFFF3F4F8),
                              //             ))
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              //Delete Icon
                              CustomSlidableAction(
                                flex: 2,
                                autoClose: true,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                onPressed: (context) {
                                  setState(() {
                                    akun.removeAt(index);
                                  });
                                  // Then show a snackbar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: MyColor.greenWhatsApp,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                        textAlign: TextAlign.start,
                                        "Chat $deletedName telah di hapus"),
                                    clipBehavior: Clip.antiAlias,
                                    duration: const Duration(seconds: 1),
                                    action: SnackBarAction(
                                        label: 'Urungkan',
                                        textColor: Colors.white,
                                        onPressed: () {
                                          setState(() {
                                            akun.insert(index, item);
                                          });
                                        }),
                                  ));
                                },
                                backgroundColor: Colors.red.shade800,
                                foregroundColor: Colors.white,
                                child: SingleChildScrollView(
                                  clipBehavior: Clip.antiAlias,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Trash.svg',
                                        color: const Color(0xFFF3F4F8),
                                      ),
                                      const Spacer(),
                                      const Text('Delete',
                                          style: TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontSize: 14,
                                            color: Color(0xFFF3F4F8),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              //More Icon
                              // CustomSlidableAction(
                              //   flex: 2,
                              //   autoClose: true,
                              //   padding: const EdgeInsets.symmetric(
                              //       vertical: 15, horizontal: 0),
                              //   onPressed: (context) {
                              //     ScaffoldMessenger.of(context)
                              //         .showSnackBar(SnackBar(
                              //       backgroundColor: MyColor.greenWhatsApp,
                              //       elevation: 3,
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(30)),
                              //       behavior: SnackBarBehavior.floating,
                              //       // ignore: prefer_const_constructors
                              //       content: Text(
                              //           textAlign: TextAlign.center,
                              //           "More is not available right now"),
                              //       clipBehavior: Clip.antiAlias,
                              //       duration: const Duration(seconds: 1),
                              //     ));
                              //   },
                              //   backgroundColor: Colors.purple.shade800,
                              //   foregroundColor: Colors.white,
                              //   child: SingleChildScrollView(
                              //     clipBehavior: Clip.antiAlias,
                              //     physics: const BouncingScrollPhysics(),
                              //     scrollDirection: Axis.horizontal,
                              //     child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         SvgPicture.asset(
                              //           "assets/icons/ic_slideadble_more.svg",
                              //           color: const Color(0xFFF3F4F8),
                              //         ),
                              //         const Spacer(),
                              //         const Text('More',
                              //             style: TextStyle(
                              //               fontFamily: 'Helvetica',
                              //               fontSize: 14,
                              //               color: Color(0xFFF3F4F8),
                              //             ))
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ]),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onLongPress: () {
                            showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) {
                                  // final list = index;
                                  return popupChat(index);
                                });
                          },
                          onTap: () {
                            showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) {
                                  // final list = index;
                                  return fullChat(index);
                                });
                          },
                          child: Container(
                              height: 74,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18)),
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Image
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            useSafeArea: false,
                                            context: context,
                                            builder: (context) =>
                                                profile(index));
                                      },
                                      child: Container(
                                        height: 61,
                                        width: 61,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    akun[index]['picture']),
                                                fit: BoxFit.cover)),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(int.parse(
                                                        akun[index]
                                                            ["Bactive"])),
                                                    width: 2.5,
                                                    style: BorderStyle.solid),
                                                color: Color(int.parse(
                                                    akun[index]["active"])),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    //Content
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: Get.width / 2,
                                                child: Text(
                                                  akun[index]['name'],
                                                  overflow: TextOverflow.clip,
                                                  softWrap: false,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'HelveticaBold',
                                                      color: MyColor.black),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  mute == true
                                                      ? SvgPicture.asset(
                                                          'assets/icons/ic_chat_mute.svg',
                                                          color: MyColor
                                                              .greenWhatsApp,
                                                          height: 15,
                                                        )
                                                      : const SizedBox(),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    akun[index]['time'],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Helvetica',
                                                        color: Color(int.parse(
                                                            akun[index][
                                                                'colorTime']))),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                akun[index]['theirChat'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Helvetica',
                                                    color: MyColor.black),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: MyColor.greenWhatsApp,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  akun[index]['chatCount'],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      height: 1.5,
                                                      fontFamily: 'Helvetica',
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ])),
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }

// PopUp chat
  Widget popupChat(int index) {
    return StatefulBuilder(builder: ((context, setState) {
      String jam = DateFormat.Hm().format(DateTime.now()).toString();

      return WillPopScope(
        onWillPop: () async {
          totalMyMessage = 0;
          _controller.text.isEmpty
              ? Navigator.pop(context)
              : popUpExit(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: GestureDetector(
              // Confirmasi jika ingin keluar saat ada teks diketik
              onTap: () {
                _controller.text.isEmpty
                    ? [Navigator.pop(context), totalMyMessage = 0]
                    : popUpExit(context);
              },
              //Content
              child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black.withOpacity(.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                            height: Get.height / 1.5,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/bgChat.jpg'),
                                    fit: BoxFit.cover)),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                children: [
                                  InkWell(
                                    splashColor: Colors.red,
                                    onTap: () {
                                      showDialog(
                                          useSafeArea: false,
                                          context: context,
                                          builder: (context) {
                                            return profile(index);
                                          });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      color: MyColor.greenWhatsApp,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 23,
                                            backgroundImage: AssetImage(
                                                akun[index]['picture']),
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  akun[index]['name'],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          'HelveticaBold',
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                const Text(
                                                  "Online",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ChatMessage(
                                      photoProfile: akun[index]['picture'],
                                      type: 'received',
                                      text: "${akun[index]["theirChat"]}",
                                      jam: "${akun[index]["time"]}"),
                                  Expanded(
                                      child: _controller.text.isEmpty
                                          ? const SizedBox()
                                          : ListView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: totalMyMessage,
                                              itemBuilder: ((context, index) =>
                                                  ChatMessage(
                                                      photoProfile:
                                                          "assets/images/pic.png",
                                                      type: 'sent',
                                                      text: _controller.text,
                                                      jam: jam.toString()
                                                      // .substring(0, 4),
                                                      )))),
                                ],
                              ),
                              bottomNavigationBar: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        scrollPhysics:
                                            const BouncingScrollPhysics(),
                                        style: const TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontSize: 18,
                                            color: Colors.white),
                                        toolbarOptions: const ToolbarOptions(
                                            copy: true,
                                            cut: true,
                                            paste: true,
                                            selectAll: true),
                                        autofocus: false,
                                        textInputAction:
                                            TextInputAction.newline,
                                        cursorColor: Colors.white,
                                        scrollController: ScrollController(
                                            keepScrollOffset: true),
                                        maxLines: 2,
                                        minLines: 1,
                                        expands: false,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 30),
                                            alignLabelWithHint: false,
                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                                255, 4, 44, 39),
                                            border: InputBorder.none,
                                            labelText: 'Message',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(.2)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                            suffixIcon: _controller.text.isEmpty
                                                ? null
                                                : GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _clearTextField();
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons.clear_rounded,
                                                        color: Colors.white),
                                                  )),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        controller: _controller,
                                        keyboardType: TextInputType.multiline,
                                        // cursorHeight: 30,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        totalMyMessage++;
                                        setState(() {});
                                        Future.delayed(const Duration(
                                                milliseconds: 30))
                                            .then(
                                                (value) => _controller.clear());
                                      },
                                      child: CircleAvatar(
                                          radius: 23,
                                          backgroundColor:
                                              MyColor.greenWhatsApp,
                                          child: const Icon(
                                            Icons.send_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      );
    }));
  }

// Full chat
  Widget fullChat(int index) {
    return StatefulBuilder(builder: ((context, setState) {
      String jam = DateFormat.Hm().format(DateTime.now()).toString();

      return WillPopScope(
        onWillPop: () async {
          totalMyMessage = 0;
          _controller.text.isEmpty
              ? Navigator.pop(context)
              : popUpExit(context);
          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/bgChat.jpg'),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  InkWell(
                    splashColor: Colors.red,
                    onTap: () {
                      showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (context) {
                            return profile(index);
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 30, bottom: 10),
                      color: MyColor.greenWhatsApp,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(akun[index]['picture']),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  akun[index]['name'],
                                  style: const TextStyle(
                                      fontFamily: 'HelveticaBold',
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                const Text(
                                  "Online",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ChatMessage(
                      photoProfile: '',
                      type: 'received',
                      text: "${akun[index]["theirChat"]}",
                      jam: "${akun[index]["time"]}"),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: totalMyMessage,
                        itemBuilder: ((context, index) => ChatMessage(
                            photoProfile: "assets/images/pic.png",
                            type: 'sent',
                            text: _controller.text,
                            jam: jam.toString()
                            // .substring(0, 4),
                            ))),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                    top: 0,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        scrollPhysics: const BouncingScrollPhysics(),
                        style: const TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 18,
                            color: Colors.white),
                        toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: true,
                            paste: true,
                            selectAll: true),
                        autofocus: false,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Colors.white,
                        scrollController:
                            ScrollController(keepScrollOffset: true),
                        maxLines: 2,
                        minLines: 1,
                        expands: false,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 30),
                            alignLabelWithHint: false,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 4, 44, 39),
                            border: InputBorder.none,
                            labelText: 'Message',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle:
                                TextStyle(color: Colors.white.withOpacity(.2)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            suffixIcon: _controller.text.isEmpty
                                ? null
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _clearTextField();
                                      });
                                    },
                                    child: const Icon(Icons.clear_rounded,
                                        color: Colors.white),
                                  )),
                        textAlignVertical: TextAlignVertical.center,
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        // cursorHeight: 30,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          totalMyMessage++;
                        });
                        Future.delayed(const Duration(milliseconds: 30))
                            .then((value) => _controller.clear());
                      },
                      child: CircleAvatar(
                          radius: 23,
                          backgroundColor: MyColor.greenWhatsApp,
                          child: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 20,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  Future<dynamic> popUpExit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              actionsAlignment: MainAxisAlignment.end,
              contentPadding: const EdgeInsets.all(10),
              actionsPadding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    totalMyMessage = 0;
                    _controller.clear();
                  },
                  child: const Text("Discard",
                      style: TextStyle(color: Colors.white38, fontSize: 14)),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Continue",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ],
              backgroundColor: MyColor.greenWhatsApp,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: const [
                    Text("Message not sent",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Want to continue?",
                        style: TextStyle(color: Colors.white38, fontSize: 14))
                  ],
                ),
              ));
        });
  }

  profile(int index) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black.withOpacity(.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 300,
                    child: Stack(children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    color: Colors.black.withOpacity(.2),
                                    child: Image.asset(
                                      akun[index]['picture'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          clipBehavior: Clip.antiAlias,
                          height: 300,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(akun[index]['picture']),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.black.withOpacity(.2),
                              child: const Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 57,
                        constraints: BoxConstraints(maxWidth: Get.width / 2.5),
                        // width: Get.width / 2.5,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                            color: Colors.black.withOpacity(.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                maxLines: 1,
                                akun[index]['name'].toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'HelveticaBold',
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                maxLines: 1,
                                akun[index]['status'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Helvetica',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Icon action
                      Align(
                        alignment: Alignment.bottomCenter,
                        // top: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IconConnect(
                                  press: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: MyColor.greenWhatsApp,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      behavior: SnackBarBehavior.floating,
                                      // ignore: prefer_const_constructors
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Chat is not available right now'),
                                      duration: const Duration(seconds: 2),
                                    ));
                                  },
                                  text: 'Message',
                                  bgColor: Colors.blue.shade800.withOpacity(.6),
                                  iconBgColor: Colors.blue.shade300,
                                  icon: 'assets/icons/Icon_IConnect_chat.svg'),
                            ),
                            FittedBox(
                              child: IconConnect(
                                  press: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: MyColor.greenWhatsApp,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // key: mykey,
                                      behavior: SnackBarBehavior.floating,
                                      // ignore: prefer_const_constructors
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Call is not available right now'),
                                      duration: const Duration(seconds: 2),
                                    ));
                                  },
                                  text: 'Call',
                                  bgColor:
                                      Colors.green.shade800.withOpacity(.6),
                                  iconBgColor: Colors.green.shade300,
                                  icon: 'assets/icons/Icon_IConnect_call.svg'),
                            ),
                            Expanded(
                              child: IconConnect(
                                  press: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: MyColor.greenWhatsApp,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      behavior: SnackBarBehavior.floating,
                                      // ignore: prefer_const_constructors
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Video Call is not available right now'),
                                      duration: const Duration(seconds: 2),
                                    ));
                                  },
                                  text: 'Video Call',
                                  bgColor:
                                      Colors.purple.shade800.withOpacity(.6),
                                  iconBgColor: Colors.purple.shade300,
                                  icon:
                                      'assets/icons/Icon_IConnect_videoCall.svg'),
                            ),
                          ],
                        ),
                      ),
                    ]),
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

class IconConnect extends StatelessWidget {
  const IconConnect({
    Key? key,
    required this.text,
    required this.iconBgColor,
    required this.bgColor,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text;
  final Color iconBgColor;
  final Color bgColor;
  final String icon;
  final Callback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        // alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        color: bgColor,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(50)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.white,
              fit: BoxFit.scaleDown,
              height: 18,
              width: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14, fontFamily: 'Helvetica', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

//bubble chat
class ChatMessage extends StatelessWidget {
  final String type, text, jam, photoProfile;

  const ChatMessage(
      {Key? key,
      required this.type,
      required this.text,
      required this.jam,
      required this.photoProfile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Row(
            mainAxisAlignment: type == "sent"
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: type == "sent"
                ? <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyColor.greenWhatsApp),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 7.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 10.0),
                                child: Text(
                                  jam,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white60),
                                ),
                              ),
                              Text(
                                text,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]
                : <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 4, 44, 39),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 7.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                text,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10.0),
                                child: Text(
                                  jam,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white60),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
      ),
    );
  }
}
