import 'package:flutter/material.dart';
import '../data/specialist_data.dart';
import '../widgets/specialist_card.dart';
import '../widgets/popular_specialist_card.dart';
import 'doctor_screen.dart';

class ChatDenganDokterScreen extends StatelessWidget {
  const ChatDenganDokterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: const BackButton(color: Color(0xFF0C103E)),
        title: const Text(
          'Chat Dengan Doctors',
          style: TextStyle(color: Color(0xFF0C103E), fontWeight: FontWeight.w400,),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.history, color: Color(0xFF0C103E)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              decoration: BoxDecoration(
                color: Color(0xFFCAD6FF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFCAD6FF)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Color(0xFF0C103E)),
                  border: InputBorder.none,
                  hintText: 'Cari Dokter, Spesialis, Atau Gejala',
                  hintStyle: TextStyle(fontSize: 13, color: Color(0xFF0C103E)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card besar: Cari Spesialis Dokter
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFCAD6FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cari Spesialis Dokter',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0C103E)
                    ),
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: specialistList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final item = specialistList[index];
                      return SpecialistCard(
                        data: item,
                        onTap: () {
                          if (!item.isMore) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DokterListScreen(specialtyTitle: item.name),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Section: Spesialis Populer Lainnya
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFCAD6FF), 
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Spesialis Populer Lainnya',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0C103E)),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularSpecialistList.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = popularSpecialistList[index];
                        return PopularSpecialistCard(data: item);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
