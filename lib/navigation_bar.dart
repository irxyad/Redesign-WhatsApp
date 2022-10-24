import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:re_whatsapp/material/colors/mycolors.dart';
import 'package:re_whatsapp/screens/calls/calls.dart';
import 'package:re_whatsapp/screens/contacts/components/tap_list_contacts.dart';
import 'package:re_whatsapp/screens/contacts/contacts.dart';
import 'package:re_whatsapp/screens/my_home/my_home.dart';
import 'package:re_whatsapp/screens/settings/settings.dart';
import 'package:re_whatsapp/screens/status/status.dart';
import 'controller/navbar_controller.dart';

class NavigationPage extends StatefulWidget {
  static String routeName = "/navbar";
  const NavigationPage({
    Key? key,
  }) : super(key: key);
  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  File? imageFile;
  BottomNavbar bottomNavbarku = Get.put(BottomNavbar());
// item Page Navbar
  var screens = [
    const MyHome(),
    const Status(),
    const Calls(),
    const Settings(),
  ];

  // Launch WhatsApp
  launchWhatsApp() async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (
          context,
        ) {
          return const SendMessageViaWA();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Function index 0
            if (bottomNavbarku.selectedIndex.value == 0) {
              launchWhatsApp();
            }
            //Function index 1
            else if (bottomNavbarku.selectedIndex.value == 1) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: MyColor.greenWhatsApp,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                behavior: SnackBarBehavior.floating,
                // ignore: prefer_const_constructors
                content:
                    // ignore: prefer_const_constructors
                    Text(textAlign: TextAlign.center, 'Tap My Status instead'),
                duration: const Duration(seconds: 2),
              ));
            }
            //Function index 2
            else if (bottomNavbarku.selectedIndex.value == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Contacts()));
            }
            //Function index 3
            else if (bottomNavbarku.selectedIndex.value == 3) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: MyColor.greenWhatsApp,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                behavior: SnackBarBehavior.floating,
                // ignore: prefer_const_constructors
                content:
                    // ignore: prefer_const_constructors
                    Text(textAlign: TextAlign.center, 'Coming soon'),
                duration: const Duration(seconds: 2),
              ));
            }
          },
          backgroundColor: MyColor.greenWhatsApp,
          elevation: 0,
          child: iconsFloatBTN()),
      body: SafeArea(
        bottom: false,
        child: Obx(
          (() => IndexedStack(
                index: bottomNavbarku.selectedIndex.value,
                children: screens,
              )),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            notchMargin: 3.0,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
                backgroundColor: MyColor.greenWhatsApp,
                selectedFontSize: 12,
                onTap: (index) {
                  bottomNavbarku.changeIndex(index);
                },
                currentIndex: bottomNavbarku.selectedIndex.value,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                elevation: 0,
                selectedItemColor: Colors.white,
                selectedLabelStyle:
                    const TextStyle(fontFamily: 'HelveticaBold', height: 1.5),
                type: BottomNavigationBarType.fixed,
                items: itemBotNavbar),
          )),
    );
  }

//Icons FLoatBTN
  Obx iconsFloatBTN() {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (bottomNavbarku.selectedIndex.value == 0) ...[
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: 25,
              width: 25,
            ),
          ] else if (bottomNavbarku.selectedIndex.value == 1) ...[
            SvgPicture.asset(
              'assets/icons/Image.svg',
              height: 25,
              width: 25,
            ),
          ] else if (bottomNavbarku.selectedIndex.value == 2) ...[
            SvgPicture.asset(
              'assets/icons/Calling.svg',
              height: 25,
              width: 25,
            ),
          ] else if (bottomNavbarku.selectedIndex.value == 3) ...[
            SvgPicture.asset(
              'assets/icons/Settings.svg',
              height: 25,
              width: 25,
            ),
          ]
        ],
      ),
    );
  }

// Item Navbar
  List<BottomNavigationBarItem> get itemBotNavbar {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/home_unselected.svg',
          height: 25,
        ),
        label: 'HOME',
        activeIcon:
            SvgPicture.asset('assets/icons/home_selected.svg', height: 25),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/status_unselected.svg',
          height: 25,
        ),
        label: 'STATUS',
        activeIcon:
            SvgPicture.asset('assets/icons/status_selected.svg', height: 25),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/calls_unselected.svg',
          height: 25,
        ),
        label: 'CALLS',
        activeIcon:
            SvgPicture.asset('assets/icons/calls_selected.svg', height: 25),
      ),
      BottomNavigationBarItem(
        icon: imageFile != null
            ? CircleAvatar(
                backgroundImage: FileImage(imageFile!),
                radius: 20,
              )
            : const CircleAvatar(
                backgroundImage: AssetImage('assets/images/pic.png'),
                radius: 20,
              ),
        label: 'Irxyad',
      ),
    ];
  }
}
