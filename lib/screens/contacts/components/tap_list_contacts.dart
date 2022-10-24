import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../material/colors/mycolors.dart';

class SendMessageViaWA extends StatefulWidget {
  const SendMessageViaWA({
    Key? key,
  }) : super(key: key);

  @override
  State<SendMessageViaWA> createState() => _SendMessageViaWAState();
}

TextEditingController _nomor = TextEditingController();
final TextEditingController _pesan = TextEditingController();

class _SendMessageViaWAState extends State<SendMessageViaWA> {
  List<Contact>? contacts;
  @override
  void initState() {
    _nomor.clear();
    _pesan.clear();
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: false);
      // ignore: avoid_print
      print(contacts);
      setState(() {});
    }
  }

  String labelNomor = 'Masukkan Nomor';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColor.greenWhatsApp,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 15,
              right: 0,
              // bottom: MediaQuery.of(context).viewInsets.bottom + 23
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Send message',
                  // 'Send message',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'HelveticaBold'),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Divider(
                  color: Colors.white,
                  height: 2,
                  thickness: 1,
                  endIndent: 220,
                ),
                const SizedBox(
                  height: 20,
                ),
                //TextField Nomor
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 16,
                            color: Colors.white),
                        toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: true,
                            paste: true,
                            selectAll: true),
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.white,
                        cursorWidth: 2,
                        cursorRadius: const Radius.circular(50),
                        onChanged: (value) {
                          setState(() {});
                        },
                        scrollController:
                            ScrollController(keepScrollOffset: true),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              splashRadius: 18,
                              onPressed: () {
                                _nomor.clear();
                                labelNomor = 'Masukkan Nomor';

                                setState(() {});
                              },
                              icon: Icon(Icons.clear_rounded,
                                  color: _nomor.text.isEmpty
                                      ? Colors.transparent
                                      : Colors.white)),
                          alignLabelWithHint: true,
                          labelText: labelNomor,
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(.2)),
                          floatingLabelStyle:
                              const TextStyle(color: Colors.white),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                        controller: _nomor,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    IconButton(
                        // disabledColor: Colors.red,
                        splashColor: const Color.fromARGB(255, 6, 75, 67),
                        splashRadius: 20,
                        highlightColor: Colors.transparent,
                        alignment: Alignment.center,
                        color: Colors.white,
                        onPressed: () async {
                          showModalBottomSheet(
                              barrierColor: Colors.black.withOpacity(.7),
                              // constraints: const BoxConstraints(maxHeight: 250),
                              enableDrag: true,
                              isScrollControlled: false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    child: SizedBox(
                                      height: 220,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.info_rounded,
                                                  color: Colors.white),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Scroll and tap contact to copy',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Helvetica'),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 100,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: MyColor.greenWhatsApp,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  25),
                                                          topRight:
                                                              Radius.circular(
                                                                  25))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Container(
                                                    // color: Colors.red,
                                                    child: listContact()),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        icon: const Icon(
                          Icons.contacts_rounded,
                          size: 20,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //TextField Pesan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: TextField(
                          showCursor: true,
                          scrollPhysics: const BouncingScrollPhysics(),

                          style: const TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              color: Colors.white),
                          toolbarOptions: const ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: true,
                              selectAll: true),
                          autofocus: false,
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            setState(() {});
                          },
                          onEditingComplete: () {
                            Navigator.canPop(context);
                          },
                          cursorColor: Colors.white,
                          maxLines: 2,
                          minLines: 1,
                          scrollController:
                              ScrollController(keepScrollOffset: true),
                          expands: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                splashRadius: 18,
                                onPressed: () {
                                  _pesan.clear();
                                  setState(() {});
                                },
                                icon: Icon(Icons.clear_rounded,
                                    color: _pesan.text.isEmpty
                                        ? Colors.transparent
                                        : Colors.white)),
                            alignLabelWithHint: true,
                            labelText: 'Masukkan Pesan',
                            labelStyle:
                                TextStyle(color: Colors.white.withOpacity(.2)),
                            floatingLabelStyle:
                                const TextStyle(color: Colors.white),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          controller: _pesan,
                          keyboardType: TextInputType.multiline,
                          cursorHeight: 20,
                          textAlign: TextAlign.start,
                          // scrollPadding: EdgeInsets.only(bottom: 40),
                        ),
                      ),
                    ),
                    IconButton(
                        // disabledColor: Colors.red,
                        splashColor: const Color.fromARGB(255, 6, 75, 67),
                        splashRadius: 20,
                        highlightColor: Colors.transparent,
                        alignment: Alignment.center,
                        color: Colors.white,
                        onPressed: () {
                          final link = WhatsAppUnilink(
                            text: _pesan.text,
                            phoneNumber: _nomor.text,
                          );
                          // ignore: deprecated_member_use
                          launch("$link");
                          _nomor.clear();
                          _pesan.clear();
                          labelNomor = '';
                        },
                        icon: const Icon(
                          Icons.send_rounded,
                          size: 20,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Scaffold listContact() {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: contacts != null
            ? CarouselSlider.builder(
                // padding: EdgeInsets.zero,
                options: CarouselOptions(
                  disableCenter: false,
                  height: 120,
                  autoPlay: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.7,
                  clipBehavior: Clip.antiAlias,
                  pageSnapping: true,
                  initialPage: 1,
                  padEnds: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                ),
                itemCount: contacts!.length,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) {
                  String num = (contacts![itemIndex].phones.isNotEmpty)
                      ? (contacts![itemIndex].phones.first.number)
                      : "No Number";

                  return GestureDetector(
                    onTap: () {
                      final numberPhone =
                          contacts![itemIndex].phones.first.number;
                      final nameNumber = contacts![itemIndex].displayName;
                      setState(() {
                        _nomor.text = numberPhone.toString();
                        labelNomor = nameNumber.toString();
                      });

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: MyColor.greenWhatsApp,
                        elevation: 3,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        content: Text(
                            textAlign: TextAlign.center,
                            'The phone number of ${contacts![itemIndex].displayName} has been copied '),
                      ));
                      Future.delayed(const Duration(seconds: 1))
                          .then((value) => Navigator.pop(context));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Card(
                        color: const Color.fromARGB(255, 12, 119, 106),
                        shadowColor: Colors.black.withOpacity(1),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Container(
                            height: 74,
                            // color: Colors.red,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Image

                                  ProfilePicture(
                                    name: contacts![itemIndex].name.first,
                                    radius: 25,
                                    fontsize: 18,
                                    random: true,
                                  ),
                                  const SizedBox(
                                    width: 11,
                                  ),
                                  //Content
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          clipBehavior: Clip.antiAlias,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            "${contacts![itemIndex].name.first} ${contacts![itemIndex].name.last}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'HelveticaBold',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          num,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Helvetica',
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ])),
                      ),
                    ),
                  );
                })
            : const Center(child: Text('Kosong')));
  }
}
