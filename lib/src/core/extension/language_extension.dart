import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/data/source/local_source.dart';
import 'package:plaff_kebab/src/injector_container.dart';

extension LocalizedDescription on Translations {
  String getLocalizedDescription() {
    String appLanguage = sl<LocalSource>().locale;
    switch (appLanguage) {
      case 'uz':
        return uz;
      case 'ru':
        return ru;
      case 'en':
        return en;
      default:
        return ''; // Return a default value if the language is not recognized
    }
  }
}

extension LocalizedName on NameTitle {
  String getLocalizedDescription() {
    String appLanguage = sl<LocalSource>().locale;
    switch (appLanguage) {
      case 'uz':
        return uz;
      case 'ru':
        return ru;
      case 'en':
        return en;
      default:
        return ''; // Return a default value if the language is not recognized
    }
  }
}
