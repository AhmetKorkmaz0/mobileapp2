// lib/features/home/presentation/widgets/prayer_times_card.dart

/// PrayerTimesCard
///
/// Ana ekran üzerinde günlük namaz vakitlerini kullanıcıya görsel ve sayısal olarak sunan kart bileşenidir.
///
/// Sorumlulukları:
/// - Üst kısım: Sıradaki vakti, konumu ve geri sayım saat/dakika/saniye bilgisini göstermek
/// - Orta kısım: Vakit şeridi ile tüm vakitleri ve durumlarını (geçmiş, mevcut) göstermek
/// - Alt kısım: Hazırlık yapma aksiyon alanı ve cami silüeti ile bilgilendirme
/// - UI tasarım: Rounded corners, gradient, shadow ve Google Fonts ile estetik görünüm sağlamak
///
/// Not:
/// Bu widget state veya veri yönetimi yapmaz.
/// Namaz vakitleri ve metinler sabit örnek üzerinden render edilmiştir.
/// Tüm değerler presentation layer’da sabit veya parametreli kullanılabilir.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ummett/core/theme/app_colors.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 340, // Kart yüksekliği arttı
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkEmerald.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 1. KATMAN: Gradient Arka Plan
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.darkEmerald, AppColors.darkerEmerald],
              ),
            ),
          ),

          // 2. KATMAN: Duman/Bulut Dokusu (Texture)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Opacity(
                opacity: 0.15,
                child: Image.network(
                  "https://www.transparenttextures.com/patterns/stardust.png", // Duman efekti
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => const SizedBox(), // İnternet yoksa boş geç
                ),
              ),
            ),
          ),

          // 3. KATMAN: İçerik
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Üst Kısım (Başlıklar ve Sayaç)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sıradaki Vakit",
                            style: GoogleFonts.poppins(
                                color: Colors.white70, fontSize: 12)),
                        Text("ÖĞLE",
                            style: GoogleFonts.playfairDisplay(
                                color: AppColors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_pin,
                                color: AppColors.gold, size: 14),
                            const SizedBox(width: 4),
                            Text("Erzurum / Palandöken",
                                style: GoogleFonts.poppins(
                                    color: Colors.white70, fontSize: 11)),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("02:13:45",
                            style: GoogleFonts.robotoMono(
                                color: AppColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w500)),
                        Text("Saat  Dakika  Saniye",
                            style: GoogleFonts.poppins(
                                color: Colors.white38, fontSize: 10)),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // Orta Kısım (Vakit Şeridi)
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTimeItem("İmsak", "05:34", isPassed: true),
                      _buildTimeItem("Güneş", "06:57", isPassed: true),
                      _buildTimeItem("Öğle", "12:34", isCurrent: true),
                      _buildTimeItem("İkindi", "15:30"),
                      _buildTimeItem("Akşam", "18:01"),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Alt Kısım (Aksiyon Alanı ve Cami Silüeti)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Cami Silüeti Arka Planı
                    Opacity(
                      opacity: 0.1,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Blue_Mosque%2C_Istanbul.jpg/300px-Blue_Mosque%2C_Istanbul.jpg",
                        height: 60,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (c, o, s) => const SizedBox(height: 60),
                      ),
                    ),
                    Column(
                      children: [
                        Text("Öğle vaktine 2 saat 13 dakika kaldı.",
                            style: GoogleFonts.poppins(
                                color: AppColors.white, fontSize: 13)),
                        Text("Hazırlık yapmak ister misin?",
                            style: GoogleFonts.poppins(
                                color: Colors.white70, fontSize: 11)),
                        const SizedBox(height: 15),

                        // Altın Gradient Buton
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                              colors: [AppColors.goldLight, AppColors.gold],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gold.withOpacity(0.4),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hazırlık Yap",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.darkEmerald,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded,
                                  color: AppColors.darkEmerald, size: 18)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Sağ Üst Köşe İkonu
          Positioned(
            top: 20,
            right: 20,
            child: Icon(Icons.explore, color: AppColors.gold, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeItem(String label, String time,
      {bool isPassed = false, bool isCurrent = false}) {
    return Column(
      children: [
        Text(label,
            style: GoogleFonts.poppins(
                color: isCurrent ? AppColors.gold : Colors.white70,
                fontSize: 11,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal)),
        const SizedBox(height: 6),
        isCurrent
            ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(time,
              style: GoogleFonts.poppins(
                  color: AppColors.darkEmerald,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        )
            : (isPassed
            ? const Icon(Icons.check_circle,
            color: Colors.white30, size: 18)
            : Text(time,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500))),
      ],
    );
  }
}