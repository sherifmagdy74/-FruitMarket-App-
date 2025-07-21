import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruit_market/main.dart';

import '../nav_bar/Nav_bar_build.dart';

class FirebaseNotification {
//   creat instanse of firebase messaging
   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//    function initialize firebase messaging
  Future<void> initializeFirebaseMessaging() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("token $token");
    handleNotificationTerminated();
  }
//   handle notification when reciveved
  void handleNotification(RemoteMessage?message ){
    if(message==null)return;
    navigatorKey.currentState!.pushNamed(NavBarBuild.routeName,arguments: message ); }

//   notification is terminated
Future handleNotificationTerminated() async{
    FirebaseMessaging.instance.getInitialMessage().then(handleNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotification);
 FirebaseMessaging.onMessage.listen(( handleNotification) {
   print("📲 Notification in FOREGROUND: ${ handleNotification.notification?.title}");
 });

      }
      }