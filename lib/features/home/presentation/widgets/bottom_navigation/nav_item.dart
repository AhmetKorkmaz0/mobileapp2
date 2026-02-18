// lib/features/home/presentation/widgets/bottom_navigation/nav_item.dart

/// NavItem
///
/// Bottom navigation bar içerisinde kullanılan tekil sekme bileşenidir.
///
/// Sorumlulukları:
/// - Bir navigasyon öğesini (ikon + label) render etmek
/// - Aktif / pasif durumuna göre görsel stil uygulamak
/// - Tıklama olayını dışarıya [onTap] callback ile iletmek
///
/// Not:
/// Bu widget state yönetmez.
/// Sadece kendisine verilen [BottomNavItem] verisine göre UI üretir.



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/models/bottom_nav_item.dart';

class NavItem extends StatelessWidget {
  final BottomNavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.gold : Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? item.activeIcon : item.icon,
              size: 28,
              color: color,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: color,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}