import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class QrScanScreen extends StatefulWidget {
@override
State<StatefulWidget> createState() => _QrScanScreenState();
}
class _QrScanScreenState extends State<QrScanScreen> {
final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
QRViewController? controller;
String? qrText;
@override
void reassemble() {
super.reassemble();
controller?.pauseCamera();
controller?.resumeCamera();
}
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(
title: Text('Scan QR Code'),
backgroundColor: Colors.black,
elevation: 0,
),
body: Column(
children: <Widget>[
Expanded(
flex: 5,
child: QRView(
key: qrKey,
onQRViewCreated: _onQRViewCreated,
overlay: QrScannerOverlayShape(
borderColor: Color(0xFFFCC737),
borderRadius: 10,
borderLength: 30,
borderWidth: 8,
cutOutSize: 250,
),
),
),
Expanded(
flex: 2,
child: Container(
width: double.infinity,
color: Colors.black,
padding: EdgeInsets.all(16),
child: Column(
children: [
Text(
qrText != null ? 'Scanned: $qrText' : 'Scan a code',
style: TextStyle(
color: qrText != null ? Color(0xFFFCC737) : Colors.white,
fontSize: 16,
),
),
SizedBox(height: 16),
ElevatedButton.icon(
onPressed: () async {
await controller?.toggleFlash();
},
style: ElevatedButton.styleFrom(
backgroundColor: Color(0xFFFCC737),
foregroundColor: Colors.black,
),
icon: Icon(Icons.flash_on),
label: Text("Toggle Flash"),
),
],
),
),
),
],
),
);
}
void _onQRViewCreated(QRViewController ctrl) {
controller = ctrl;
controller!.scannedDataStream.listen((scanData) {
controller?.pauseCamera();
setState(() {
qrText = scanData.code;
});
// Optionally: show a dialog or navigate
});
}
@override


void dispose() {
controller?.dispose();
super.dispose();
}
}