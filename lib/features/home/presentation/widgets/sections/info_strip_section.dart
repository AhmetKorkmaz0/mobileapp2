// lib/features/home/presentation/widgets/sections/info_strip_section.dart

/// InfoStripSection
///
/// Ana ekranda yatay bilgi şeridi oluşturan sunum bileşenidir.
///
/// Sorumlulukları:
/// - Ramazan günü, hicri tarih ve oruç günü bilgilerini göstermek
/// - İkon + metin formatında kompakt bir bilgi alanı oluşturmak
/// - Bilgileri görsel ayraçlarla birbirinden ayırmak
///
/// Not:
/// Bu widget state yönetmez ve veri üretmez.
/// İçerik değerlerini HomeConstants üzerinden alarak yalnızca UI üretir.


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/constants/home_constants.dart';

class InfoStripSection extends StatelessWidget {
  const InfoStripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoItem(Icons.mosque, HomeConstants.ramadanDay),
          _buildInfoDivider(),
          _buildInfoItem(Icons.calendar_today_outlined, HomeConstants.hijriDate),
          _buildInfoDivider(),
          _buildInfoItem(Icons.wb_sunny_outlined, HomeConstants.fastingDay),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoDivider() {
    return Container(
      height: 20,
      width: 1,
      color: Colors.grey.shade300,
    );
  }
}