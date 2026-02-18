// lib/features/home/presentation/widgets/common/light_effect_layer.dart

/// LightEffectLayer
///
/// Arayüz üzerine dekoratif bir radial gradient overlay ekleyen görsel efekt katmanıdır.
///
/// Sorumlulukları:
/// - Merkezden dışa doğru hafif karartma (vignette) efekti oluşturmak
/// - İçeriğe derinlik ve odak hissi kazandırmak
///
/// Not:
/// Bu widget yalnızca görsel amaçlıdır.
/// State yönetmez ve etkileşim içermez.
/// Genellikle Stack içinde üst katman olarak kullanılır.


import 'package:flutter/material.dart';

class LightEffectLayer extends StatelessWidget {
  const LightEffectLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.15),
          ],
          stops: const [0.6, 1.0],
        ),
      ),
    );
  }
}