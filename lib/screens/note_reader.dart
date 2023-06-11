import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

// ignore: must_be_immutable
class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorIndex = widget.doc['color'];
    return Scaffold(
      backgroundColor: AppStyle.cardColorOptions[colorIndex],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColorOptions[colorIndex],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["timestamp"],
              style: AppStyle.date,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.doc["content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
