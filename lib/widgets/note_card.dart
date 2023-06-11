import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot documentSnapshot) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardColorOptions[documentSnapshot["color"]],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            documentSnapshot["note_title"],
            style: AppStyle.mainTitle,
          ),
          const SizedBox(height: 4.0,),
          Text(
            documentSnapshot["timestamp"],
            style: AppStyle.date,
          ),
          const SizedBox(height: 8.0,),
          Text(
            documentSnapshot["content"],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
