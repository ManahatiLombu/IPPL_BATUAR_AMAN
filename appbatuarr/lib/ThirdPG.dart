import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool _cameraPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      setState(() {
        _cameraPermissionGranted = true;
      });
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() {
        _cameraPermissionGranted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wisata AR',
          style: TextStyle(
            fontSize: 23,
            fontFamily: 'Sniglet',
          ),
        ),
        backgroundColor: Color.fromRGBO(118, 168, 106, 1),
        centerTitle: true,
      ),
      body: Center(
        child: _cameraPermissionGranted
            ? UnityWidget(
                onUnityCreated: (controller) {
                  controller.postMessage(
                      "VuforiaManager", "InitializeVuforia", "LicenseKey");
                },
              )
            : ElevatedButton(
                onPressed: () {
                  _requestCameraPermission();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(148, 196, 125, 1),
                  minimumSize: Size(200, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Izinkan Kamera',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Sniglet',
                  ),
                ),
              ),
      ),
    );
  }
}

