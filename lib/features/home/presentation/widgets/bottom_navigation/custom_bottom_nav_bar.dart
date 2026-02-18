// lib/features/home/presentation/widgets/bottom_navigation/custom_bottom_nav_bar.dart

/// CustomBottomNavBar
///
/// Ana ekran için özel tasarlanmış bir alt navigasyon barı widget'ıdır.
///
/// Sorumlulukları:
/// - Aktif sekmeyi [currentIndex] üzerinden yönetmek
/// - Sekme tıklamalarını [onItemTapped] callback'i ile dışarıya bildirmek
/// - Navigasyon öğelerini HomeConstants.bottomNavItems listesinden dinamik üretmek
/// - Ortada özel tasarlanmış dairesel bir merkez aksiyon butonu göstermek
///
/// Not:
/// Merkez buton (index 2) arka plan Row yapısına dahil edilmez.
/// Ayrı bir Positioned widget olarak Stack içinde konumlandırılır.

import 'package:flutter/material.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/constants/home_constants.dart';
import 'package:ummett/features/home/presentation/models/bottom_nav_item.dart';
import 'package:ummett/features/home/presentation/widgets/bottom_navigation/nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          _buildBackground(screenWidth),
          _buildCenterButton(),
        ],
      ),
    );
  }

  Widget _buildBackground(double screenWidth) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < HomeConstants.bottomNavItems.length; i++)
            if (i != 2) // Merkez buton hariç
              _buildNavItemWrapper(i),
        ],
      ),
    );
  }

  Widget _buildNavItemWrapper(int index) {
    final item = HomeConstants.bottomNavItems[index];
    final isActive = currentIndex == index;

    return NavItem(
      item: item,
      isActive: isActive,
      onTap: () => onItemTapped(index),
    );
  }

  Widget _buildCenterButton() {
    return Positioned(
      top: 0,
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: AppColors.parchment,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.gold, width: 3),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          image: const DecorationImage(
            image: NetworkImage(HomeConstants.arabesqueTextureUrl),
            opacity: 0.1,
          ),
        ),
        child: const Center(
          child: Icon(Icons.explore, size: 36, color: AppColors.darkEmerald),
        ),
      ),
    );
  }
}