import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/components/custom_appbar.dart';
import 'package:intesasoft_demo/app/components/custom_drawer.dart';

import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';
import 'package:intesasoft_demo/locator.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';
import 'package:intesasoft_demo/views/home/home_view.dart';
import 'package:intesasoft_demo/views/home/home_viewmodel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  late QRViewController controller;
  _QRPageState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: context.mediumSymmetric,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.qr_code_scanner,
                  size: 50,
                ),
                AutoSizeText(
                  "QR OKUT",
                  style: context.headline3.copyWith(
                    color: customBlack,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.height * 70,
            width: context.width * 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {
                  controller.resumeCamera();
                },
                child: QRView(
                  overlay: QrScannerOverlayShape(
                    borderRadius: 10,
                    borderColor: Colors.white,
                    borderWidth: 5,
                  ),
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (scanData != null) {
          controller.pauseCamera();
          locator.get<HomeViewModel>().qrTextEditingController.text =
              scanData.code!;
          locator.get<HomeViewModel>().getQrText(scanData.code!);
          locator.get<HomeViewModel>().filterCities(scanData.code);
          locator.get<HomeViewModel>().setHomeView(0);
          log(scanData.code!);
          controller.stopCamera();
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
