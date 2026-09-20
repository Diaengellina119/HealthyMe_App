import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/medicine_card.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final List<String> _categories = ['Respiratory', 'Heart', 'Skin', 'Children'];
  String _selectedCategory = 'Respiratory';
  bool _showSortMenu = false;

  static const List<Map<String, String>> _medicineItems = [
    {
      'name': 'Paracetamol 500mg',
      'price': 'Rp10.000',
      'image': 'assets/images/medicine/paracetamol.png'
    },
    {
      'name': 'Paracetamol 500mg',
      'price': 'Rp10.000',
      'image': 'assets/images/medicine/paracetamol.png'
    },
    {
      'name': 'Paracetamol 500mg',
      'price': 'Rp10.000',
      'image': 'assets/images/medicine/paracetamol.png'
    },
  ];

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: AppColors.dark, fontSize: 16)),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _medicineItems.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = _medicineItems[index];
                return MedicineCard(
                  name: item['name']!,
                  price: item['price']!,
                  imageAsset: item['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: AppColors.dark),
        title: const Text('Medicine',
            style: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton.icon(
              onPressed: () => setState(() => _showSortMenu = !_showSortMenu),
              icon: const Icon(Icons.tune, size: 16, color: AppColors.primary),
              label: const Text('Filter',
                  style: TextStyle(color: AppColors.primary)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                        Icon(Icons.search, color: AppColors.dark),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final cat = _categories[index];
                        final selected = cat == _selectedCategory;
                        return ChoiceChip(
                          label: Text(cat),
                          selected: selected,
                          onSelected: (_) =>
                              setState(() => _selectedCategory = cat),
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                              color:
                                  selected ? Colors.white : AppColors.primary,
                              fontSize: 12),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                            side: BorderSide(
                                color: selected
                                    ? Colors.transparent
                                    : AppColors.primary),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSection('Medicine'),
                  _buildSection('Suplement and Multivitamin'),
                  _buildSection('Salep'),
                ],
              ),
            ),
          ),
          if (_showSortMenu)
            Positioned(
              top: 8,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 10)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Sort By',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(label: Text('Name')),
                        Chip(label: Text('Rating')),
                        Chip(label: Text('Category')),
                        Chip(label: Text('Price')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
