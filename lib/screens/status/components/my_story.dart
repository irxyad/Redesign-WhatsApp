import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyStory extends StatelessWidget {
  const MyStory({
    Key? key,
    required this.images,
    required this.caption,
  }) : super(key: key);

  final File? images;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          images!,
          fit: BoxFit.cover,
          height: Get.height,
          width: Get.width,
          filterQuality: FilterQuality.high,
          isAntiAlias: true,
          // scale: 8,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Center(
          child: Image.file(
            images!,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
            // scale: 8,
          ),
        ),
        caption.isEmpty
            ? const SizedBox()
            : Center(
                child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        height: 35,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.5),
                        ),
                        child: Text(
                          caption,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      )),
                ),
              )
        // Caption
        // caption == '' ? const SizedBox() : captionStory(caption),
      ],
    );
  }
}
