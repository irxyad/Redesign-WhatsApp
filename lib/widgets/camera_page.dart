import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Camerapage extends StatefulWidget {
  const Camerapage({Key? key}) : super(key: key);

  @override
  State<Camerapage> createState() => _CamerapageState();
}

class _CamerapageState extends State<Camerapage> {
  late CameraController cameraC;

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    cameraC = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    await cameraC.initialize();
  }

  @override
  void dispose() {
    cameraC.dispose();
    super.dispose();
  }

  Future<File> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = "${root.path}/Guided_Camera";
    await Directory(directoryPath).create(recursive: true);
    String filePath = "$directoryPath/${DateTime.now()}.jpg";

    try {
      await cameraC.takePicture();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: initializeCamera(),
          builder: (_, snapshot) =>
              (snapshot.connectionState == ConnectionState.done)
                  ? Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width *
                              cameraC.value.aspectRatio,
                          child: CameraPreview(cameraC),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () async {
                              if (!cameraC.value.isTakingPicture) {
                                File result = await takePicture();

                                // ignore: use_build_context_synchronously
                                Navigator.pop(context, result);
                                setState(() {});
                              }
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                    )),
    );
  }
}
