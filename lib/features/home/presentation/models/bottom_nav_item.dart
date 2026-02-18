// lib/features/home/presentation/models/bottom_nav_item.dart

/// BottomNavItem
///
/// Alt navigasyon barındaki bir sekmeyi temsil eden veri modelidir.
///
/// Sorumlulukları:
/// - Sekme başlığı ([label]), pasif ([icon]) ve aktif ([activeIcon]) ikonlarını saklamak
/// - Sekmenin işlevsel tipini ([type]) belirtmek
///
/// Not:
/// Bu model UI render etmez veya state yönetmez.
/// Alt navigasyon bar için immutable veri taşıyıcı olarak kullanılır.

import 'package:flutter/material.dart';

enum BottomNavItemType { home, worship, explore, profile }

class BottomNavItem {
  final String label;
  final IconData icon;      // Şimdi tanındı
  final IconData activeIcon; // Şimdi tanındı
  final BottomNavItemType type;

  const BottomNavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.type,
  });
}