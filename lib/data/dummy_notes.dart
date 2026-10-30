import 'package:flutter/material.dart';

import '../models/note_item.dart';
import '../theme/app_theme.dart';

const List<NoteItem> dummyNotes = [
  NoteItem(
    title: 'Ide Aplikasi',
    date: '19 Oktober 2026',
    time: '09.30',
    content: 'Ide untuk membuat aplikasi catatan sederhana dengan fitur kategori, warna, dan prioritas. Aplikasi ini digunakan untuk mencatat ide, rencana, dan hal penting sehari-hari.',
    icon: Icons.lightbulb_outline,
    iconColor: AppColors.iconYellow,
    cardColor: AppColors.pastelYellow,
    category: 'Penting',
    priority: 'Penting',
  ),
  NoteItem(
    title: 'Rencana Mingguan',
    date: '18 Oktober 2026',
    time: '08.15',
    content: 'Menyusun agenda mingguan: senin rapat tim, selasa review desain, dan jumat evaluasi progres proyek.',
    icon: Icons.calendar_today_outlined,
    iconColor: AppColors.iconGreen,
    cardColor: AppColors.pastelGreen,
    category: 'Kerja',
    priority: 'Sedang',
  ),
  NoteItem(
    title: 'Catatan Kuliah',
    date: '17 Oktober 2026',
    time: '13.00',
    content: 'Rangkuman materi kuliah struktur data: linked list, stack, queue, dan penerapannya dalam pemrograman.',
    icon: Icons.menu_book_outlined,
    iconColor: AppColors.iconPurple,
    cardColor: AppColors.pastelPurple,
    category: 'Pribadi',
    priority: 'Sedang',
  ),
  NoteItem(
    title: 'Hal yang Perlu Dibeli',
    date: '16 Oktober 2026',
    time: '17.45',
    content: 'Daftar belanja: beras, telur, sabun, buku tulis, dan baterai cadangan untuk mouse.',
    icon: Icons.shopping_cart_outlined,
    iconColor: AppColors.iconPink,
    cardColor: AppColors.pastelPink,
    category: 'Pribadi',
    priority: 'Rendah',
  ),
  NoteItem(
    title: 'Jurnal Harian',
    date: '15 Oktober 2026',
    time: '21.20',
    content: 'Hari yang produktif. Berhasil menyelesaikan tugas dan sempat berolahraga pagi. Tetap semangat besok.',
    icon: Icons.auto_stories_outlined,
    iconColor: AppColors.iconBlue,
    cardColor: AppColors.pastelBlue,
    category: 'Penting',
    priority: 'Sedang',
  ),
];
