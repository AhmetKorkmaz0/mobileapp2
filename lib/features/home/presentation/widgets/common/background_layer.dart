// lib/features/home/presentation/widgets/common/background_layer.dart
/// BackgroundLayer
///
/// Home ekranı için temel arka plan katmanını sağlayan widget'tır.
///
/// Sorumlulukları:
/// - Sabit arka plan rengi (AppColors.parchment) uygulamak
/// - Hafif doku efekti için backgroundTextureUrl ile image overlay eklemek
/// - UI öğelerinin üzerine dekoratif ve görsel bir temel oluşturmak
///
/// Not:
/// Bu widget state, içerik veya etkileşim yönetmez.
/// Sadece presentation layer’da arka plan katmanı olarak kullanılır.

import 'package:flutter/material.dart';
import 'package:ummett/core/theme/app_colors.dart';
import 'package:ummett/features/home/presentation/constants/home_constants.dart';

class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.parchment,
        image: DecorationImage(
          image: NetworkImage(HomeConstants.backgroundTextureUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.05),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}