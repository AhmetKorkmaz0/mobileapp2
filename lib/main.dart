// lib/main.dart
/// Uygulama giriş noktası ve global konfigürasyon
///
/// Sorumlulukları:
/// - Flutter uygulamasını başlatmak (runApp)
/// - Status bar şeffaflığı ve ikon renklerini ayarlamak
/// - MaterialApp ile tema ve root widget (HomePage) yapılandırmak
/// - Global ayarlar ve debug banner kontrolü sağlamak
///
/// Not:
/// Bu dosya UI detaylarını veya state yönetimini içermez.
/// Sadece uygulamanın başlangıç ve configuration katmanını oluşturur.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Bu kütüphane şart
import 'features/home/presentation/pages/home_page.dart';

void main() {
  // Status Bar'ı şeffaf yapma ve tam ekran modu
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Şeffaf arka plan
    statusBarIconBrightness: Brightness.dark, // İkonlar koyu renk (saat vs.)
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manevi App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}