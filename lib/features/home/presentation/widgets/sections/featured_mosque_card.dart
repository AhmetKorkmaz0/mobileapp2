// lib/features/home/presentation/widgets/sections/featured_mosque_card.dart

/// FeaturedMosqueCard
///
/// Ana ekranda öne çıkan bir camiyi görsel ve metin bilgisi ile sunan kart widget’ıdır.
///
/// Sorumlulukları:
/// - Cami görselini (featuredMosqueImage) ve bilgilerini (isim, detay/puan) göstermek
/// - Kart tasarımını padding, border radius ve shadow ile estetik hale getirmek
/// - Sağ üst köşede opsiyonel ikon (more_horiz) göstermek
///
/// Not:
/// Bu widget state veya veri yönetimi yapmaz.
/// Tüm içerik HomeConstants üzerinden sabit olarak alınır.
/// UI-only ve presentation layer’da reusable component olarak tasarlanmıştır.



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/constants/home_constants.dart';

class FeaturedMosqueCard extends StatelessWidget {
  const FeaturedMosqueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          _buildMosqueImage(),
          const SizedBox(width: 15),
          _buildMosqueInfo(),
          const Spacer(),
          const Icon(Icons.more_horiz, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildMosqueImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        HomeConstants.featuredMosqueImage,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 60,
          height: 60,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildMosqueInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeConstants.featuredMosqueName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          HomeConstants.featuredMosqueDetails,
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}