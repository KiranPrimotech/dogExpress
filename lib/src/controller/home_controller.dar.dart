import 'package:dog_news/src/model/response/news_response_model.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:dog_news/utils/sizes_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../notification/notification_service.dart';
import '../../utils/localization/localization_String.dart';
import '../UI/card/shared_pref.dart';
import '../network/api_call.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{

  ThemeController themeController = Get.find();

  /// Position of tab from 0.0 to 1.0
  RxDouble position = 0.0.obs;
  RxString title="My Feeds".obs;
  RxDouble selectedItem = 3.0.obs;
  bool modeValue = false;
  RxInt indexValue=0.obs;


  /// Page controller
  late PageController appBarTab;/// App Bar Tab controller
  late PageController homeTab;/// Dashboard tab controller
  late PageController webTab;/// Dashboard tab controller
  late PageController itemTab;/// Dashboard tab controller

  /// Tab switch duration
  Duration durationLong = const Duration(milliseconds: 500);
  Duration durationShort = const Duration(milliseconds: 10);
  Duration animationDuration = const Duration(milliseconds: 300);

  /// Animation Controller
  late AnimationController appBarAnimationController;
  late AnimationController bottomBarAnimationController;

  /// App Bar tab viewport
  double viewportFraction = 0.3;

  /// AppBar Height
  double appBarHeight = 50.h;

  late List<Articles> newsList ;

  @override
  void onInit() async {


    NotificationService.initialize();
    firebaseNotification();
    SizeConfig().init(Get.context!);

    /// initialize App Bar Tab Controller
    appBarTab = PageController(
      initialPage: 0,
      viewportFraction: viewportFraction,
    );
    /// initialize Dashboard Tab Controller
    homeTab = PageController(initialPage: 0);
    /// initialize webTab Tab Controller
    webTab = PageController(initialPage: 0);
    /// initializa ItemTab Controller
    itemTab = PageController(initialPage: 3 , viewportFraction: .4);
    itemTab.addListener((){
      selectedItem.value = itemTab.page ?? 3.0;
    });
    /// initialize Dashboard Tab Listener

    homeTab.addListener(() {
      homeTab.offset;
      appBarTab.animateTo(homeTab.offset / 3,
          duration: durationShort, curve: Curves.linear);

      position.value = homeTab.page ?? 0;
      if(checkVisibility(check: VisibilityEnum.dashboard)!){
        appBarAnimationController.forward();
        if(bottomBarAnimationController.isCompleted){
          bottomBarAnimationController.reverse(from: appBarHeight);}
      }

      print("index value ---- ${indexValue}");



    });

    // homeTab.addListener(() {
    //   homeTab.offset;
    //   appBarTab.animateTo(homeTab.offset / 3,
    //       duration: durationShort, curve: Curves.linear);
    //   position.value = homeTab.page ?? 0;
    //   if(checkVisibility(check: VisibilityEnum.dashboard)!){
    //     appBarAnimationController.forward();
    //   }
    // });

    /// initialize app bar animation controller
    appBarAnimationController = AnimationController(duration : animationDuration,vsync: this);
    appBarAnimationController.forward();
    /// initialize bottom bar animation controller
    bottomBarAnimationController = AnimationController(duration : animationDuration,vsync: this);
    getData();
    await getModeValue();
    themeController.getThemeModeFromPreferences();

    themeController.upgradeFun( modeValue);




    super.onInit();
  }


  Future<void> getNewsList() async {
    newsList = await CallAPI().getNewsList();
    print("resposne ---- ${newsList}");

  }

  @override
  void onClose() {
    appBarTab.dispose();
    homeTab.dispose();
    webTab.dispose();
    itemTab.dispose();
    super.onClose();
  }

  /// Check the visibility of widgets
  bool? checkVisibility({required VisibilityEnum check}){
    Map<VisibilityEnum , bool>  visibilityCase= {
      /// Is Discover Tab open
      VisibilityEnum.dashboard: (position.value<= 0.2) ,
      /// Is Feed tab open
      VisibilityEnum.feeds: (position.value >= 0.8),
      /// Is between discover and feed
      VisibilityEnum.invisbleHomeIcon: (position.value >0.2   && position.value <= 0.8),
  };
    return visibilityCase[check];
  }


  /// Return action performed for certain widget
  Function homeFunctions({required HomeFunctions action}){
    Map<HomeFunctions ,void Function()> actions = {
      /// Click back icon in app bar
      HomeFunctions.backIcon : (){homeFunctions(action: HomeFunctions.discoverBar)();},
      /// Click forward icon in app bar
      HomeFunctions.forwardIcon : (){homeFunctions(action: HomeFunctions.feedBar)();},
      /// Click search icon in tab bar
      HomeFunctions.search : (){ Get.toNamed(AppRoutes.search);},
      /// Click setting icon in app bar
      HomeFunctions.setting : (){
        Get.toNamed(AppRoutes.setting);
      },
      /// Click discover text in app bar
      HomeFunctions.discoverBar : (){
        homeTab.animateToPage(0, duration: durationLong, curve: Curves.easeInOut);
        appBarTab.animateToPage(0, duration: durationLong, curve: Curves.easeInOut);
        bottomBarAnimationController.reverse(from: 50);
      },
      /// Click feed text in app bar
      HomeFunctions.feedBar : (){
        homeTab.animateToPage(1, duration: durationLong, curve: Curves.easeInOut);
        appBarTab.animateToPage(1, duration: durationLong, curve: Curves.easeInOut);

      },

      HomeFunctions.refresh : (){print(action);},
    };

    Function act = actions[action]!;
    return act ;
  }


  /// firebase notification
    getFirebaseNotification()  async {

    print("firebase -----------------------------------------------------");

      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        //  'This channel is used for important notifications.', // description
        importance: Importance.max,
      );
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("Message Recieved ${message!.notification!.title}");

        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        print("Message Recieved ${notification!.title}");

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  icon: android?.smallIcon,

                  // other properties...
                ),
              ));
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('Message clicked!');
      });

    }

    /// local and firebase notification
   firebaseNotification(){
     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
       NotificationService.showNotification(message);
     });
   }

  /// get Langauge

  getData() async {
    if( await SharePreference.getStringValuesSF(LocalString.langKey) != "" && await SharePreference.getStringValuesSF(LocalString.langKey) != null){
      Locale  locale=  await  SharePreference.getStringValuesSF(LocalString.langKey) == LocalString.eng  ? const Locale('en', 'US') : const Locale('hi', 'IND');
      if(locale != Get.locale){
        Get.updateLocale(locale);
      }

    }
    else{
      print("home page -------------");
    }

  }

  /// get Mode value for theme change
  getModeValue() async{

    modeValue = await SharePreference.getBoolValuesSF("mode")??false;
  }

  initializeLocalNotification(){

  }

}




enum VisibilityEnum{
  dashboard,
  feeds,
  invisbleHomeIcon,
}

enum HomeFunctions{
  setting,
  backIcon,
  forwardIcon,
  discoverBar,
  feedBar,
  refresh,
  search
}