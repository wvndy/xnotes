import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/responsive_center.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  String? _category;
  int _colorIndex = 0;
  String _priority = 'Sedang';

  static const List<Color> _colors = [
    AppColors.pastelGreen,
    AppColors.pastelYellow,
    AppColors.pastelPink,
    AppColors.pastelPurple,
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _save() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Catatan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ResponsiveCenter(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label('Judul Catatan'),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan judul catatan',
                ),
              ),
              const SizedBox(height: 20),
              _label('Isi Catatan'),
              TextField(
                controller: _contentController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: 'Tulis catatan Anda di sini...',
                ),
              ),
              const SizedBox(height: 20),
              _label('Kategori'),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(hintText: 'Pilih kategori'),
                items: const [
                  DropdownMenuItem(value: 'Penting', child: Text('Penting')),
                  DropdownMenuItem(value: 'Pribadi', child: Text('Pribadi')),
                  DropdownMenuItem(value: 'Kerja', child: Text('Kerja')),
                ],
                onChanged: (value) => setState(() => _category = value),
              ),
              const SizedBox(height: 20),
              _label('Warna'),
              Row(
                children: List.generate(_colors.length, (index) {
                  final selected = _colorIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _colorIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: const EdgeInsets.only(right: 14),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _colors[index],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : AppColors.border,
                          width: selected ? 3 : 1,
                        ),
                      ),
                      child: selected
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: AppColors.primary,
                            )
                          : null,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              _label('Prioritas'),
              Row(
                children: [
                  'Rendah',
                  'Sedang',
                  'Tinggi',
                ].map((p) => _priorityOption(p)).toList(),
              ),
              const SizedBox(height: 32),
              ElevatedButton(onPressed: _save, child: const Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _priorityOption(String value) {
    final selected = _priority == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _priority = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.textSecondary,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
