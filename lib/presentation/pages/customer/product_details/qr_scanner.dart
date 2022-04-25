import 'package:final_year_project/presentation/pages/customer/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class QrScanner extends StatefulWidget {
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  ScanController scanController = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR CODE"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: ScanView(
              controller: scanController,
              scanAreaScale: .7,
              scanLineColor: Colors.green.shade400,
              onCapture: (data) {
                Navigator.pushReplacementNamed(context, ProductDetails.routeName,arguments: data);
              },
            ),
          ),
        ),
      ),
    );
  }
}
