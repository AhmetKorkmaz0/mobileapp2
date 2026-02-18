// lib/features/home/presentation/constants/home_constants.dart

/// HomeConstants
///
/// Home ekranında kullanılan sabit değerleri ve konfigürasyonları merkezi olarak tutan sınıftır.
///
/// Sorumlulukları:
/// - Kullanıcı selamlaması, tarih bilgileri, ramazan/oruç günleri
/// - Günlük içerik başlık ve metinleri
/// - Öne çıkan camii bilgileri ve görsel texture URL’leri
/// - Alt navigasyon bar öğeleri (label, icon, aktif icon, tip)
///
/// Not:
/// Bu sınıf veri üretmez veya state yönetmez.
/// Tüm değerler presentation layer’da sabit olarak kullanılmak üzere tasarlanmıştır.


import 'package:flutter/material.dart';
import 'package:ummett/features/home/presentation/models/bottom_nav_item.dart';

class HomeConstants {
  static const String greeting = "Es-Selamü Aleyküm";
  static const String userName = "Ahmet";

  static const String dateGregorian = "16 Şubat";
  static const String dateHijri = "1445-18-8";

  static const String ramadanDay = "7 Ramazan";
  static const String hijriDate = "18 Mart 1445 H";
  static const String fastingDay = "6. Gün";

  static const String dailyContentTitle = "Günün Ayeti & Hadisi";
  static const String dailyVerse = "Şüphesiz, namaz müminlere belirli vakitlerde farz kılınmıştır.";
  static const String dailyVerseReference = "Buhari, Bed'ü'l-Vahy, 1";

  static const String featuredMosqueName = "Erzurum'un En Beğenilen Camii";
  static const String featuredMosqueDetails = "Lalapaşa Camii - 4.8 Puan";
  static const String featuredMosqueImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Erzurum_Ulu_Camii.jpg/300px-Erzurum_Ulu_Camii.jpg";

  static const String backgroundTextureUrl = "https://www.transparenttextures.com/patterns/paper.png";
  static const String arabesqueTextureUrl = "https://www.transparenttextures.com/patterns/arabesque.png";

  static const List<BottomNavItem> bottomNavItems = [
    BottomNavItem(
      label: "Ana Sayfa",
      icon: Icons.home_outlined,
      activeIcon: Icons.home_filled,
      type: BottomNavItemType.home,
    ),
    BottomNavItem(
      label: "İbadetlerim",
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view_rounded,
      type: BottomNavItemType.worship,
    ),
    BottomNavItem(
      label: "Keşfet",
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore,
      type: BottomNavItemType.explore,
    ),
    BottomNavItem(
      label: "Profil",
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
      type: BottomNavItemType.profile,
    ),
  ];
}