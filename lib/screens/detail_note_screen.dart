import 'package:flutter/material.dart';

import '../data/dummy_notes.dart';
import '../models/note_item.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_center.dart';

class DetailNoteScreen extends StatelessWidget {
  final NoteItem? note;

  const DetailNoteScreen({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    final data = note ?? dummyNotes.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Catatan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Hapus',
            onPressed: () {},
          ),
        ],
      ),
      body: ResponsiveCenter(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: data.cardColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(data.icon, color: data.iconColor, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data.priority,
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${data.date} · ${data.time ?? '09.30'}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.border),
                const SizedBox(height: 16),
                Text(
                  data.content,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.7,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
