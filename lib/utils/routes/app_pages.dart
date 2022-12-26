import 'package:dog_news/src/UI/auth/phone_uth.dart';
import 'package:dog_news/src/UI/auth/sign_in_options.dart';
import 'package:dog_news/src/UI/auth/verify_otp.dart';
import 'package:dog_news/src/UI/discover/discover_page.dart';
import 'package:dog_news/src/UI/discover/insight/insight_screen.dart';
import 'package:dog_news/src/UI/discover/notificaton_detail/notification_detail.dart';
import 'package:dog_news/src/UI/discover/poll/poll_screen.dart';
import 'package:dog_news/src/UI/discover/puzzle/puzzle_screen.dart';
import 'package:dog_news/src/UI/discover/quote/quote_screen.dart';
import 'package:dog_news/src/UI/home/pagerrr.dart';
import 'package:dog_news/src/UI/home_page.dart';
import 'package:dog_news/src/UI/setting/notification.dart';
import 'package:dog_news/src/UI/setting/pasue_notifictaion.dart';
import 'package:dog_news/src/UI/setting/relevancy/relevancy_screen.dart';
import 'package:dog_news/src/UI/setting/setting_page.dart';
import 'package:get/get.dart';
import '../../src/UI/discover/search/search_screen.dart';
import '../../src/bindings/auth_binding.dart';
import '../../src/bindings/discover_binding.dart';
import '../../src/bindings/home_binding.dart';
import '../../src/bindings/home_binding_crad.dart';
import '../../src/bindings/insight_binding.dart';
import '../../src/bindings/notification_binding.dart';
import '../../src/bindings/notifiocation_detail_binding.dart';
import '../../src/bindings/pause_noti_binding.dart';
import '../../src/bindings/poll_binding.dart';
import '../../src/bindings/puzzle_binding.dart';
import '../../src/bindings/quote_binding.dart';
import '../../src/bindings/relevancy_binding.dart';
import '../../src/bindings/search_binding.dart';
import '../../src/bindings/setting_binding.dart';
import '../../src/bindings/signin_phone_binding.dart';
import '../../src/bindings/verify_otp_binding.dart';
import 'app_routes.dart';

class AppPages {
  static String initialRoute = AppRoutes.homeTabView;
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomeScreen(),
      binding: HomeBindingCard(),
    ),
    GetPage(
      name: AppRoutes.discover,
      page: () => DiscoverScreen(),
      binding: DiscoverBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.homeTabView,
      page: () => HomeTabView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeTabView,
      page: () => HomeTabView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.pauseNotification,
      page: () => const PauseNotification(),
      binding: PauseNotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () =>  SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.phoneAuth,
      page: () =>  PhoneAuthScreen(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOtp,
      page: () =>  const VerifyOTPScreen(),
      binding: VerifyOTPBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () =>   SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.quoteScreen,
      page: () =>   QuoteScreen(),
      binding: QuoteBinding(),
    ),
    GetPage(
      name: AppRoutes.notificationDetail,
      page: () =>   NotificationDetailScreen(),
      binding: NotificationDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.pollScreen,
      page: () =>   PollScreen(),
      binding: PollBinding(),
    ),
    GetPage(
      name: AppRoutes.puzzleScreen,
      page: () =>   PuzzleScreen(),
      binding: PuzzleBinding(),
    ),
    GetPage(
      name: AppRoutes.insightScreen,
      page: () =>   InsightScreen(),
      binding: InsightBinding(),
    ),
    GetPage(
      name: AppRoutes.relevancyScreen,
      page: () =>   RelevancyScreen(),
      binding: RelevancyBinding(),
    ),
  ];
}
