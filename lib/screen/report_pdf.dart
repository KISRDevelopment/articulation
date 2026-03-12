import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'report_data.dart';

Future<Uint8List> buildPatientReportPdf(PatientReportData data,
    {bool useArabic = true}) async {
  //final doc = pw.Document();

  pw.Font? bodyFont;
  pw.Font? amiriBold;
  if (useArabic) {
    final fontData = await rootBundle.load('assets/fonts/Amiri-Regular.ttf');
    final boldData    = await rootBundle.load('assets/fonts/Amiri-Bold.ttf');
    bodyFont = pw.Font.ttf(fontData);
    amiriBold    = pw.Font.ttf(boldData);
  }

    final doc = pw.Document(
    theme: useArabic
        ? pw.ThemeData.withFont(base: bodyFont!, bold: amiriBold!)
        : pw.ThemeData(),
  );
  final base = pw.TextStyle(fontSize: 12);
  final bold = pw.TextStyle(font: amiriBold, fontSize: 12);

  pw.Widget kv(String k, String v) => pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.end,
    children: [
      pw.Text(k, style: bold,
                textDirection: useArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr),
      pw.SizedBox(width: 8),

         pw.Text(
          v,
          style: base,
          textDirection: useArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        ),

    ],
  );

  pw.Widget tableBlock({
    required String title,
    required List<String> headers,
    required List<List<String>> rows,
  }) {
    final twoColWidths = <int, pw.TableColumnWidth>{
    0: const pw.FlexColumnWidth(5), 
    1: const pw.FlexColumnWidth(5), 
  };
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.SizedBox(height: 12),
        pw.Text(title, style: bold, textDirection: useArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr,),
        pw.SizedBox(height: 6),
        rows.isEmpty
            ? pw.Text('لا توجد بيانات',
                style: base,
                textDirection: useArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr)
            : pw.Directionality(
              textDirection: useArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr, 
            child: pw.TableHelper.fromTextArray(
              tableWidth: pw.TableWidth.max,
              columnWidths: twoColWidths,
                headers: headers,
                data: rows,
                headerStyle: bold,
                
                cellStyle: base,
                headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
                cellAlignment: pw.Alignment.center,
                headerAlignment: pw.Alignment.center,
              ),)
      ],
    );
  }

  /*final wordRows = data.words
      .map((w) => [(w['word'] ?? '').toString(), (w['comment'] ?? '').toString()])
      .toList();*/

  final wordRows = data.words
      .map((w) => [ (w['comment'] ?? '').toString(), (w['word'] ?? '').toString()])
      .toList();

  /*final sentenceRows = data.sentences
      .map((s) => [(s['sentence'] ?? '').toString(), (s['comment'] ?? '').toString()])
      .toList();*/

    final sentenceRows = data.sentences
      .map((s) => [ (s['comment'] ?? '').toString(), (s['sentence'] ?? '').toString()])
      .toList();

  /*final storyRows = data.stories
      .map((s) => [(s['story'] ?? '').toString(), (s['comment'] ?? '').toString()])
      .toList();*/

  final storyRows = data.stories
      .map((s) => [ (s['comment'] ?? '').toString(), (s['story'] ?? '').toString()])
      .toList();

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(28),
      build: (_) => [
        pw.Center(
          child: pw.Text('تقرير المريض',
              style: bold,
                textDirection: useArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr),
        ),
        pw.SizedBox(height: 16),

        kv(data.fullName, 'الأسم:'),
        pw.SizedBox(height: 6),
        kv( data.civilId.toString(), 'الرقم المدني:'),
        pw.SizedBox(height: 6),
        kv( data.fileNumber, 'رقم الملف:'),
        pw.Divider(),

        tableBlock(title: 'الكلمات',   headers: ['التعليق', 'الكلمة'], rows: wordRows),
        tableBlock(title: 'الجمل',     headers: ['التعليق', 'الجملة'], rows: sentenceRows),
        tableBlock(title: 'القصص',     headers: ['التعليق', 'القصة'], rows: storyRows),

        pw.SizedBox(height: 12),
      ],
    ),
  );

  return doc.save();
}
