import 'package:get/get.dart';
import 'langs/en_US.dart';
import 'langs/am_ET.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'am_ET': amEt,
      };
}
