import 'package:trips/utils/language_manager.dart';

class Trip {
  final String id;
  final String title;
  final String description;
  final double price;
  final int nights;
  final String img;
  final double rating;
  final String category;
  final String location;
  final List<String> features;
  final bool isPopular;

  Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.nights,
    required this.img,
    this.rating = 4.5,
    required this.category,
    required this.location,
    required this.features,
    this.isPopular = false,
  });

  String get formattedPrice => '\$${price.toInt()}';

  String get durationText {
    if (LanguageManager.currentLanguage == 'fa') {
      return '$nights ${nights > 1 ? 'شب' : 'شب'}';
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