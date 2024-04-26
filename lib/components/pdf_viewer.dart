import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PDFViewer extends StatefulWidget {
  final String url;

  const PDFViewer({Key? key, required this.url}) : super(key: key);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String localPath = "";

  @override
  void initState() {
    super.initState();
    downloadFile(widget.url);
  }

  Future<void> downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/dummy.pdf'); // Sử dụng lớp File từ dart:io

    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (localPath.isEmpty) {
      return Center(child: CircularProgressIndicator()); // Hiển thị spinner khi tải
    } else {
      return PDFView(
        filePath: localPath,
      );
    }
  }
}
