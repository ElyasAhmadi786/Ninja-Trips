import 'package:trips/utils/language_manager.dart';

class Trip {
  final String id;
  final String titleEn;
  final String titleFa;
  final String descriptionEn;
  final String descriptionFa;
  final double price;
  final int nights;
  final String img;
  final double rating;
  final String category;
  final String locationEn;
  final String locationFa;
  final List<String> featuresEn;
  final List<String> featuresFa;
  final bool isPopular;

  Trip({
    required this.id,
    required this.titleEn,
    required this.titleFa,
    required this.descriptionEn,
    required this.descriptionFa,
    required this.price,
    required this.nights,
    required this.img,
    this.rating = 4.5,
    required this.category,
    required this.locationEn,
    required this.locationFa,
    required this.featuresEn,
    required this.featuresFa,
    this.isPopular = false,
  });

  String get title => LanguageManager.currentLanguage == 'fa' ? titleFa : titleEn;
  String get description => LanguageManager.currentLanguage == 'fa' ? descriptionFa : descriptionEn;
  String get location => LanguageManager.currentLanguage == 'fa' ? locationFa : locationEn;
  List<String> get features => LanguageManager.currentLanguage == 'fa' ? featuresFa : featuresEn;

  String get formattedPrice => '\$${price.toInt()}';

  String get durationText {
    if (LanguageManager.currentLanguage == 'fa') {
      return '$nights شب';
    }
    return '$nights ${nights > 1 ? 'nights' : 'night'}';
  }

  String get translatedCategory {
    switch (category.toLowerCase()) {
      case 'beach':
        return LanguageManager.translate('beach');
      case 'mountain':
        return LanguageManager.translate('mountain');
      case 'city':
        return LanguageManager.translate('city');
      case 'desert':
        return LanguageManager.translate('desert');
      case 'island':
        return LanguageManager.translate('island');
      case 'ski':
        return LanguageManager.translate('ski');
      default:
        return category;
    }
  }
}