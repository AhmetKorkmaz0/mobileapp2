// lib/core/theme/app_colors.dart

/// AppColors
///
/// Uygulama genelinde kullanılan tüm renkleri merkezi bir sınıfta tanımlar.
///
/// Sorumlulukları:
/// - Arka plan, kart, metin, buton ve vurgular için sabit renkleri sağlamak
/// - Renk tutarlılığı ve okunabilirlik için anlamlı isimler kullanmak
/// - Hard-coded hex değerlerini merkezi ve reusable hale getirmek
///
/// Not:
/// Bu sınıf UI render etmez veya state yönetmez.
/// Tüm renkler presentation layer’da referans olarak kullanılmak üzere tasarlanmıştır.

import 'package:flutter/material.dart';

class AppColors {
  // Arka Plan (Parşömen / Kağıt Dokusu Rengi)
  static const Color parchment = Color(0xFFF4F1EA);
  static const Color background = Color(0xFFF4F1EA); // Eskisiyle uyum için

  // Koyu Yeşil (Kartlar ve Ana Tema - Zümrüt Yeşili)
  static const Color darkEmerald = Color(0xFF0F3A2E);
  static const Color darkerEmerald = Color(0xFF08241C);

  // Eski isimleri koruyalım ki diğer dosyalarda hata çıkmasın, ama yeni renklere yönlendirelim
  static const Color darkGreen = darkEmerald;
  static const Color darkerGreen = darkerEmerald;

  // Altın Sarısı (Butonlar ve Vurgular)
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldDark = Color(0xFFB49020);
  static const Color goldLight = Color(0xFFE5C560);

  // Metin ve Kart Renkleri
  static const Color textPrimary = Color(0xFF1A3C2F);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cream = Color(0xFFFDFCF8); // Kart arka planları için
}