import 'package:get/get.dart';

import '../modules/detail_of_surah/bindings/detail_of_surah_binding.dart';
import '../modules/detail_of_surah/views/detail_of_surah_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/detail_tafsir/bindings/detail_tafsir_binding.dart';
import '../modules/detail_tafsir/views/detail_tafsir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/pray/bindings/pray_binding.dart';
import '../modules/pray/views/pray_view.dart';
import '../modules/quran/bindings/quran_binding.dart';
import '../modules/quran/views/quran_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TAFSIR,
      page: () => DetailTafsirView(),
      binding: DetailTafsirBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_OF_SURAH,
      page: () => const DetailOfSurahView(),
      binding: DetailOfSurahBinding(),
    ),
    GetPage(
      name: _Paths.QURAN,
      page: () => const QuranView(),
      binding: QuranBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRAY,
      page: () => const PrayView(),
      binding: PrayBinding(),
    ),
  ];
}
