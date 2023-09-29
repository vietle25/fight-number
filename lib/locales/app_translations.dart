import 'package:get/get.dart';
import 'package:fight_number/locales/i18n_da.dart';
import 'package:fight_number/locales/i18n_de.dart';
import 'package:fight_number/locales/i18n_en.dart';
import 'package:fight_number/locales/i18n_es.dart';
import 'package:fight_number/locales/i18n_fi.dart';
import 'package:fight_number/locales/i18n_fr.dart';
import 'package:fight_number/locales/i18n_it.dart';
import 'package:fight_number/locales/i18n_ja.dart';
import 'package:fight_number/locales/i18n_nl.dart';
import 'package:fight_number/locales/i18n_no.dart';
import 'package:fight_number/locales/i18n_pt.dart';
import 'package:fight_number/locales/i18n_sv.dart';
import 'package:fight_number/locales/i18n_vi.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'da': da,
        'nl': nl,
        'fr': fr,
        'de': de,
        'it': it,
        'no': no,
        'pt': pt,
        'es': es,
        'sv': sv,
        'fi': fi,
        'ja': ja,
        'vi': vi,
      };
}
