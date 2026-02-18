// lib/features/home/presentation/widgets/home_widgets.dart

/// Home Widgets Barrel File
///
/// Home ekranında kullanılan tüm widget’ları tek bir noktadan export eden dosyadır.
///
/// Sorumlulukları:
/// - Header, info strip, content card, featured mosque card gibi section widget’larını toplamak
/// - Bottom navigation ve nav item widget’larını toplamak
/// - Common background ve light effect layer widget’larını export etmek
/// - Home ekranı için modüler, temiz ve kolay erişilebilir import sağlamak
///
/// Not:
/// Bu dosya UI render etmez veya state yönetmez.
/// Sadece home ile ilgili widget’ları toplamak ve dışa açmak için kullanılır.



export 'sections/header_section.dart';
export 'sections/info_strip_section.dart';
export 'sections/content_card_section.dart';
export 'sections/featured_mosque_card.dart';
export 'bottom_navigation/custom_bottom_nav_bar.dart';
export 'bottom_navigation/nav_item.dart';
export 'common/background_layer.dart';
export 'common/light_effect_layer.dart';