// lib/features/home/presentation/pages/home_page.dart

/// HomePage
///
/// Uygulamanın ana home ekranını oluşturan page-level widget'tır.
///
/// Sorumlulukları:
/// - Arka plan ve dekoratif katmanları (BackgroundLayer, LightEffectLayer) konumlandırmak
/// - İçerik katmanlarını (HeaderSection, PrayerTimesCard, InfoStripSection, WorshipStatusCard, ContentCardSection, FeaturedMosqueCard) render etmek
/// - Alt navigasyon barı (CustomBottomNavBar) ile aktif sekmeyi yönetmek
/// - Kullanıcı etkileşimlerini yakalayarak state (_currentIndex) güncellemek
///
/// Not:
/// Bu page içerik verisi üretmez veya ağ çağrısı yapmaz.
/// Tüm UI widget’larını birleştiren layout ve koordinasyon görevini üstlenir.

import 'package:flutter/material.dart';
import 'package:ummett/features/home/presentation/widgets/prayer_times_card.dart';
import 'package:ummett/features/home/presentation/widgets/worship_status_card.dart';
import 'package:ummett/features/home/presentation/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Arka Plan Katmanları
          const Positioned.fill(child: BackgroundLayer()),
          const Positioned.fill(child: LightEffectLayer()),

          // İçerik Katmanı
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: const Column(
                children: [
                  HeaderSection(),
                  SizedBox(height: 15),
                  PrayerTimesCard(),
                  InfoStripSection(),
                  WorshipStatusCard(),
                  ContentCardSection(),
                  FeaturedMosqueCard(),
                ],
              ),
            ),
          ),

          // Navigasyon Katmanı
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              currentIndex: _currentIndex,
              onItemTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
                // Navigasyon işlemleri burada yapılacak
              },
            ),
          ),
        ],
      ),
    );
  }
}