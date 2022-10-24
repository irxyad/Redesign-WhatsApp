import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../material/colors/mycolors.dart';
import '../status/components/profile_pic.dart';

class Settings extends StatelessWidget {
  //routes
  static String routeName = '/calls';
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: MyColor.greenWhatsApp),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
                top: 40.0,
                left: 25.0,
              ),
              child: Text(
                textAlign: TextAlign.start,
                'WhatsApp',
                style: TextStyle(
                    color: MyColor.greenWhatsApp,
                    fontSize: 24,
                    fontFamily: 'HelveticaBold'),
              ),
            ),
            //Container Profile
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 10),
              child: Container(
                alignment: Alignment.center,
                height: 120,
                width: Get.width,
                // color: Colors.red,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 90,
                      width: 90,
                      child: ProfilePic(h: 90, w: 90, radius: 14),
                    ),
                    // : GestureDetector(),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Irxyad',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'HelveticaBold'),
                          ),
                          Text(
                            'Busy 🚫',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Helvetica'),
                          )
                        ])
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 25),
                decoration: const BoxDecoration(
                    color: Color(0xFFF3F4F8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const ListOpsi(
                          headline: "Account",
                          icon: "assets/icons/ic_setting_account.svg",
                          subs: "Privacy, security, change number",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const ListOpsi(
                          headline: "Chats",
                          icon: "assets/icons/ic_setting_chat.svg",
                          subs: "Privacy, security, change number",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const ListOpsi(
                          headline: "Notification",
                          icon: "assets/icons/ic_setting_notification.svg",
                          subs: "Privacy, security, change number",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const ListOpsi(
                          headline: "Storage and data",
                          icon: "assets/icons/ic_setting_storage.svg",
                          subs: "Privacy, security, change number",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const ListOpsi(
                          headline: "Help",
                          icon: "assets/icons/ic_setting_help.svg",
                          subs: "Privacy, security, change number",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const ListOpsi(
                          headline: "Invite a friend",
                          icon: "assets/icons/ic_setting_invite.svg",
                          subs: "For easier communication",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "from\n",
                                  style: TextStyle(
                                      color: MyColor.black.withOpacity(.5),
                                      fontSize: 13)),
                              TextSpan(
                                  text: "Irxyad",
                                  style: TextStyle(
                                      color: MyColor.black, fontSize: 16)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class ListOpsi extends StatelessWidget {
  const ListOpsi({
    Key? key,
    required this.headline,
    required this.subs,
    required this.icon,
  }) : super(key: key);

  final String headline, subs, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              color: MyColor.black,
              fit: BoxFit.contain,
              height: 25,
              width: 25,
              alignment: Alignment.center,
            ),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "$headline\n",
                  style: TextStyle(color: MyColor.black, fontSize: 16)),
              TextSpan(
                  text: subs,
                  style: TextStyle(
                      color: MyColor.black.withOpacity(.5), fontSize: 13))
            ]),
          )
        ],
      ),
    );
  }
}
