// lib/features/home/presentation/widgets/worship_status_card.dart

/// WorshipStatusCard
///
/// Ana ekran üzerinde kullanıcıya günlük ibadet ilerlemesini görsel ve sayısal olarak sunan kart bileşenidir.
///
/// Sorumlulukları:
/// - Dairesel progress ve küçük nokta göstergesi ile günlük ibadet tamamlanma durumunu göstermek
/// - Progress barlar ile ibadet detaylarını sunmak (Tesbih, Sayfa, vb.)
/// - “Dinle” butonu ve diğer aksiyonları görsel olarak yerleştirmek
/// - Kart tasarımı (padding, border radius, gölge, renk) ile estetik görünüm sağlamak
///
/// Not:
/// Bu widget state veya veri yönetimi yapmaz.
/// Tüm değerler statik örnek olarak kullanılmıştır.
/// Sadece UI ve kullanıcı bilgilendirme amacı taşır.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';

class WorshipStatusCard extends StatelessWidget {
  const WorshipStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cream, // Kırık beyaz/krem
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          // Sol Taraf: Halka Grafik
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Yarım Daire İlerleme Çubuğu
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: 1.0, // Tam dolu
                    strokeWidth: 6,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.darkEmerald),
                  ),
                ),
                // Ortadaki İçerik
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.mosque, color: AppColors.darkEmerald, size: 24),
                    Text("5/5",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkEmerald)),
                  ],
                ),
                // Altındaki Noktalar
                Positioned(
                  bottom: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        7,
                            (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: index < 5
                                ? AppColors.gold
                                : Colors.grey.shade300,
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 25),

          // Sağ Taraf: Barlar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Günlük İbadet",
                    style: GoogleFonts.poppins(
                        fontSize: 13, color: AppColors.textSecondary)),
                const SizedBox(height: 15),
                _buildProgressBar("Tesbih", "93 / 100", 0.93, AppColors.darkEmerald),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: _buildProgressBar(
                            "Sayfa", "20 / 600", 0.05, AppColors.gold)),
                    const SizedBox(width: 15),
                    // Dinle Butonu
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Dinle",
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgressBar(
      String label, String value, double progress, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: GoogleFonts.poppins(
                    fontSize: 12, color: AppColors.textPrimary)),
            Text(value,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            color: color,
            minHeight: 6,
          ),
        )
      ],
    );
  }
}