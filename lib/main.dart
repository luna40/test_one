import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
 

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _createPDF,
          child: const Text('Create PDF'),
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('Welcome to PDF Succinctly!',
        PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
        const Rect.fromLTWH(0, 100, 440, 550));


  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/Pdf_Succinctly.jpg');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
