import 'package:flutter/material.dart';

import '../app/routes.dart';
import '../data/dummy_notes.dart';
import '../models/note_item.dart';
import '../theme/app_theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/note_card.dart';
import '../widgets/responsive_center.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<String> _categories = [
    'Semua',
    'Penting',
    'Pribadi',
    'Kerja',
  ];

  String _selected = 'Semua';

  List<NoteItem> get _visibleNotes {
    if (_selected == 'Semua') return dummyNotes;
    return dummyNotes.where((n) => n.category == _selected).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenter(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildSearch()),
          SliverToBoxAdapter(child: _buildChips()),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            sliver: SliverList.separated(
              itemCount: _visibleNotes.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final note = _visibleNotes[index];
                return NoteCard(
                  note: note,
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.detailNote,
                    arguments: note,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Swandy 👋',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Apa yang ingin kamu catat hari ini?',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.pastelBlue,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(Icons.person_outline, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari catatan...',
                prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = _categories[index];
          return CategoryChip(
            label: category,
            selected: _selected == category,
            onTap: () => setState(() => _selected = category),
          );
        },
      ),
    );
  }
}
