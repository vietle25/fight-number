import 'package:flutter/material.dart';
import 'package:fight_number/model/language_model.dart';

/// Language
class Language {
  static const English = 'en'; //en_GB done
  static const Vietnamese = 'vi'; // vietnam
  static const Danish = 'da'; //da_DK done
  static const Dutch = 'nl'; // nl_NL
  static const French = 'fr'; //fr_FR done
  static const German = 'de'; //de_DE done
  static const Italian = 'it'; // it_IT done
  static const Norwegian = 'no'; //no_NO
  static const Portuguese = 'pt'; //pt_PT
  static const Spanish = 'es'; // es_ES done
  static const Swedish = 'sv'; //sv_SE
  static const Finnish = 'fi'; //fi_FI done
  static const Japanese = 'ja'; // ja_JP

  static final english = LanguageModel(
    name: "English",
    code: const Locale('en').languageCode,
    countryCode: 'GB',
    localesCode: 'en_GB',
    flag: "assets/images/gb.png",
  );

  static final vietnamese = LanguageModel(
    name: "Vietnamese",
    code: const Locale('vi').languageCode,
    countryCode: 'vn',
    localesCode: 'vi_VN',
    flag: "assets/images/vietnam.png",
  );

  static final danish = LanguageModel(
    name: "Danish",
    code: const Locale('da').languageCode,
    countryCode: 'DK',
    localesCode: 'da_DK',
    flag: "assets/images/dk.png",
  );

  static final dutch = LanguageModel(
    name: 'Dutch',
    code: const Locale('nl').languageCode,
    countryCode: 'NL',
    localesCode: 'nl_NL',
    flag: "assets/images/nl.png",
  );

  static final french = LanguageModel(
    name: "French",
    code: const Locale('fr').languageCode,
    countryCode: 'FR',
    localesCode: 'fr_FR',
    flag: "assets/images/fr.png",
  );

  static final german = LanguageModel(
    name: "German",
    code: const Locale('de').languageCode,
    countryCode: 'DE',
    localesCode: 'de_DE',
    flag: "assets/images/de.png",
  );

  static final italian = LanguageModel(
    name: "Italian",
    code: const Locale('it').languageCode,
    countryCode: 'IT',
    localesCode: 'it_IT',
    flag: "assets/images/it.png",
  );

  static final norwegian = LanguageModel(
    name: "Norwegian",
    code: const Locale('no').languageCode,
    countryCode: 'NO',
    localesCode: 'no_NO',
    flag: "assets/images/no.png",
  );

  static final portuguese = LanguageModel(
    name: "Portuguese",
    code: const Locale('pt').languageCode,
    countryCode: 'PT',
    localesCode: 'pt_PT',
    flag: "assets/images/pt.png",
  );

  static final spanish = LanguageModel(
    name: "Spanish",
    code: const Locale('es').languageCode,
    countryCode: 'ES',
    localesCode: 'es_ES',
    flag: "assets/images/es.png",
  );

  static final swedish = LanguageModel(
    name: "Swedish",
    code: const Locale('sv').languageCode,
    countryCode: 'SE',
    localesCode: 'sv_SE',
    flag: "assets/images/se.png",
  );

  static final finnish = LanguageModel(
    name: "Finnish",
    code: const Locale('fi').languageCode,
    countryCode: 'FI',
    localesCode: 'fi_FI',
    flag: "assets/images/fi.png",
  );

  static final japanese = LanguageModel(
    name: 'Japanese',
    code: const Locale('ja').languageCode,
    countryCode: 'JP',
    localesCode: 'ja_JP',
    flag: "assets/images/jp.png",
  );

  static final languages = [
    english,
    danish,
    dutch,
    french,
    german,
    italian,
    norwegian,
    portuguese,
    spanish,
    swedish,
    finnish,
    japanese,
  ];
}
