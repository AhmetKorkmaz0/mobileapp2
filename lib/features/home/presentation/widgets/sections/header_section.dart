// lib/features/home/presentation/widgets/sections/header_section.dart

/// HeaderSection
///
/// Ana ekranın üst başlık bölümünü oluşturan sunum bileşenidir.
///
/// Sorumlulukları:
/// - Kullanıcıyı selamlama metnini ve kullanıcı adını göstermek
/// - Miladi ve hicri tarih bilgisini chip formatında sunmak
/// - Ayarlar ikonunu görsel olarak konumlandırmak
///
/// Not:
/// Bu widget state yönetmez ve veri üretmez.
/// İçerik değerlerini HomeConstants üzerinden alarak yalnızca UI üretir.


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/constants/home_constants.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildGreeting(),
          _buildRightSection(),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeConstants.greeting,
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
        Text(
          HomeConstants.userName,
          style: GoogleFonts.playfairDisplay(
            color: AppColors.darkEmerald,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRightSection() {
    return Row(
      children: [
        _buildDateChip(),
        const SizedBox(width: 12),
        _buildSettingsButton(),
      ],
    );
  }

  Widget _buildDateChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.nightlight_round, size: 16, color: AppColors.darkEmerald),
          const SizedBox(width: 8),
          Text(
            HomeConstants.dateGregorian,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.darkEmerald,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            HomeConstants.dateHijri,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: const Icon(Icons.settings_outlined, size: 22, color: AppColors.darkEmerald),
    );
  }
}