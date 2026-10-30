import 'package:flutter/material.dart';

class NoteItem {
  final String title;
  final String date;
  final String? time;
  final String content;
  final IconData icon;
  final Color iconColor;
  final Color cardColor;
  final String category;
  final String priority;

  const NoteItem({
    required this.title,
    required this.date,
    this.time,
    required this.content,
    required this.icon,
    required this.iconColor,
    required this.cardColor,
    required this.category,
    required this.priority,
  });
}
