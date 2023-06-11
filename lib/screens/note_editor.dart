import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
  Widget build(BuildContext context) {
    int randomColorIndex = Random().nextInt(AppStyle.cardColorOptions.length);
    String date = DateTime.now().toString();
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return Scaffold(
      backgroundColor: AppStyle.cardColorOptions[randomColorIndex],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColorOptions[randomColorIndex],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add a new note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(date, style: AppStyle.date),
            const SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: contentController,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Content'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": titleController.text,
            "timestamp": date,
            "content": contentController.text,
            "color": randomColorIndex
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add new note due to $error"));
        },
        backgroundColor: AppStyle.accent,
        child: const Icon(Icons.save),
      ),
    );
  }
}
