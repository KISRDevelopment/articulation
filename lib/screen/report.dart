import 'dart:typed_data';
import 'package:articulation/screen/report_loader.dart';
import 'package:articulation/screen/report_pdf.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportPage extends StatelessWidget {
  final String civilId;
  const ReportPage({Key? key, required this.civilId}) : super(key: key);

    Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final int cid = int.parse(civilId);             // convert once
    final data = await loadPatientReport(cid);       // read from DB
    return buildPatientReportPdf(data, useArabic: true);  // render
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Report')),
      body: PdfPreview(
        build: _buildPdf,
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        allowSharing: true,
        allowPrinting: true,
        pdfFileName: 'patient_$civilId.pdf',
      ),
    );
  }
}
