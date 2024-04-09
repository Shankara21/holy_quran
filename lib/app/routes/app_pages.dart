import 'package:get/get.dart';

import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/detail_tafsir/bindings/detail_tafsir_binding.dart';
import '../modules/detail_tafsir/views/detail_tafsir_view.dart';
import '../modules/doa/bindings/doa_binding.dart';
import '../modules/doa/views/doa_view.dart';
import '../modules/doa_page/bindings/doa_page_binding.dart';
import '../modules/doa_page/views/doa_page_view.dart';
import '../modules/dzikir/bindings/dzikir_binding.dart';
import '../modules/dzikir/views/dzikir_view.dart';
import '../modules/dzikir_by_category/bindings/dzikir_by_category_binding.dart';
import '../modules/dzikir_by_category/views/dzikir_by_category_view.dart';
import '../modules/hadith/bindings/hadith_binding.dart';
import '../modules/hadith/views/hadith_view.dart';
import '../modules/hadith_by_mahzab/bindings/hadith_by_mahzab_binding.dart';
import '../modules/hadith_by_mahzab/views/hadith_by_mahzab_view.dart';
import '../modules/hadith_range/bindings/hadith_range_binding.dart';
import '../modules/hadith_range/views/hadith_range_view.dart';
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
import '../modules/shalat/bindings/shalat_binding.dart';
import '../modules/shalat/views/shalat_view.dart';

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
    GetPage(
      name: _Paths.DOA,
      page: () => const DoaView(),
      binding: DoaBinding(),
    ),
    GetPage(
      name: _Paths.DZIKIR,
      page: () => const DzikirView(),
      binding: DzikirBinding(),
    ),
    GetPage(
      name: _Paths.HADITH,
      page: () => const HadithView(),
      binding: HadithBinding(),
    ),
    GetPage(
      name: _Paths.SHALAT,
      page: () => const ShalatView(),
      binding: ShalatBinding(),
    ),
    GetPage(
      name: _Paths.HADITH_BY_MAHZAB,
      page: () => HadithByMahzabView(),
      binding: HadithByMahzabBinding(),
    ),
    GetPage(
      name: _Paths.HADITH_RANGE,
      page: () => HadithRangeView(),
      binding: HadithRangeBinding(),
    ),
    GetPage(
      name: _Paths.DZIKIR_BY_CATEGORY,
      page: () => DzikirByCategoryView(),
      binding: DzikirByCategoryBinding(),
    ),
    GetPage(
      name: _Paths.DOA_PAGE,
      page: () => const DoaPageView(),
      binding: DoaPageBinding(),
    ),
  ];
}
