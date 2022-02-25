import 'dart:convert';

import 'package:delta_markdown/delta_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:markdown/markdown.dart' hide Text;

class FlutterQuill extends StatefulWidget {
  FlutterQuill({Key? key}) : super(key: key);

  @override
  State<FlutterQuill> createState() => _FlutterQuillState();
}

class _FlutterQuillState extends State<FlutterQuill> {
  final _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Quill')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ElevatedButton(
              child: Text('Append'),
              onPressed: () {
                setState(() {
                  _controller.document
                      .insert(_controller.document.length - 1, 'yes');
                });
              },
            ),
            ElevatedButton(
              child: Text('HTML'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Card(
                      child: Text(
                        _quillDeltaToHtml(_controller.document.toDelta()),
                      ),
                    );
                  },
                );
              },
            ),
            QuillToolbar.basic(
              controller: _controller,
              showBackgroundColorButton: false,
              showCenterAlignment: false,
              showColorButton: false,
              showImageButton: false,
              showInlineCode: false,
              showLink: false,
              showListCheck: false,
              showStrikeThrough: false,
              showUnderLineButton: false,
              showVideoButton: false,
              multiRowsDisplay: false,
            ),
            QuillEditor.basic(
              controller: _controller,
              readOnly: false,
            ),
          ],
        ),
      ),
    );
  }

  String _quillDeltaToHtml(Delta delta) {
    return (markdownToHtml(deltaToMarkdown(jsonEncode(delta.toJson()))));
  }
}
