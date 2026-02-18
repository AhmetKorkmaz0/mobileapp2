// lib/features/home/presentation/widgets/sections/content_card_section.dart
/// ContentCardSection
///
/// Ana ekran üzerinde günlük içerik kartını render eden sunum bileşenidir.
///
/// Sorumlulukları:
/// - Günlük başlığı, metni ve referansı göstermek
/// - Dekoratif kart tasarımını (renk, gölge, border, texture) uygulamak
/// - "Dinle" aksiyon butonunu görsel olarak sunmak
///
/// Not:
/// Bu widget veri çekmez ve state yönetmez.
/// İçerik değerlerini HomeConstants üzerinden alarak yalnızca UI üretir.



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/constants/home_constants.dart';

class ContentCardSection extends StatelessWidget {
  const ContentCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: _buildDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 15),
          _buildContent(),
          const SizedBox(height: 15),
          _buildActionButton(),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.cream,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: const Offset(0, 5),
        )
      ],
      border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      image: const DecorationImage(
        image: NetworkImage(HomeConstants.backgroundTextureUrl),
        opacity: 0.05,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          HomeConstants.dailyContentTitle,
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.darkEmerald,
          ),
        ),
        const Icon(Icons.more_horiz, color: AppColors.gold),
      ],
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIconContainer(),
        const SizedBox(width: 15),
        _buildVerseContainer(),
      ],
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.darkEmerald.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.menu_book, color: AppColors.darkEmerald, size: 22),
    );
  }

  Widget _buildVerseContainer() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HomeConstants.dailyVerse,
            style: GoogleFonts.playfairDisplay(
              fontSize: 14,
              color: AppColors.textPrimary,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              HomeConstants.dailyVerseReference,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.darkEmerald,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkEmerald.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_circle_fill, color: AppColors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              "Dinle",
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}