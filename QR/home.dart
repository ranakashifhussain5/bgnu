import 'package:flutter/material.dart';
import 'package:qr_scanner/QR/qr_gen.dart';
import 'package:qr_scanner/QR/qr_scan.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Generator & Scanner")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Generate QR Code"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QRGeneratorScreen()),
                );
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text("Scan QR Code"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QRScannerScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
