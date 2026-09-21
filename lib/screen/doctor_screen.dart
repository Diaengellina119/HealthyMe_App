import 'package:flutter/material.dart';
import '../data/doctor_data.dart';
import '../widgets/doctor_card.dart';
import '../widgets/filter_button.dart';

class DokterListScreen extends StatelessWidget {
  final String specialtyTitle; 

  const DokterListScreen({super.key, required this.specialtyTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: const BackButton(color: Color(0xFF0C103E)),
        title: Text(
          specialtyTitle,
          style: const TextStyle(
            color: Color(0xFF0C103E),
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Color(0xFF0C103E)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris "Filter Berdasarkan" & "Hapus Filter"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Berdasarkan',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                TextButton(
                  onPressed: () {
                    
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text(
                    'Hapus Filter',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Chip filter
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  FilterChipButton(label: 'Urutkan'),
                  FilterChipButton(label: 'Pengalaman'),
                  FilterChipButton(label: 'Jenis Kelamin'),
                  FilterChipButton(label: 'Untuk Anak'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // List dokter
            Expanded(
              child: ListView.builder(
                itemCount: doctorList.length,
                itemBuilder: (context, index) {
                  final doctor = doctorList[index];
                  return DoctorCard(
                    data: doctor,
                    onChatTap: () {
                      
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}