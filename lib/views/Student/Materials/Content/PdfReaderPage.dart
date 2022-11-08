//implement highlights
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:treepy/app_styles.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'MakeNotes.dart';

class ReadingPage extends StatefulWidget {
  final String pdfUrl;
  const ReadingPage({
    Key? key,
    required this.pdfUrl})
      : super(key: key);

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late String pdfUrl1;
  @override
  void initState() {
    pdfUrl1 = widget.pdfUrl;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push((context),
              MaterialPageRoute(builder: (context) => const MakeNotesPage()
              ));
        },


        child: Icon(Icons.add),
        ) ,
      appBar: AppBar(
          centerTitle: true,
          title: Text('pdf reader page',),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body:SfPdfViewer.network(pdfUrl1,
        key: _pdfViewerKey,
      ),
    );
  }
}