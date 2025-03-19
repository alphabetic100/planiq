import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  static String? _fCMToken;
  static String? get fCM => _fCMToken;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Initialize Push Notification Service
  Future<void> initialize() async {
    /// Request permission for iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("User granted permission for push notifications");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("User granted provisional permission for push notifications");
    } else {
      log("User denied or has not granted permission");
    }

    /// Get FCM Token (Optional: Use this for testing with FCM API)
    _fCMToken = await _firebaseMessaging.getToken();
    log("FCM Token: $_fCMToken");

    /// Handle Foreground Notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Received a foreground message: ${message.notification?.title}");
      _showNotification(message);
    });

    /// Handle Background and Terminated State Notifications
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("User clicked on a notification while the app was in background.");
      _navigateToScreen(message);
    });

    /// Handle Notification Click When App Was Terminated
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        log("Notification clicked when app was terminated.");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _navigateToScreen(message);
        });
      }
    });

    /// Initialize Local Notification Settings
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/notification_icon');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        log("Local notification clicked");
        _navigateToScreenFromLocal();
      },
    );

    // Create notification channels for Android
    await _createNotificationChannel();
  }

  /// Create notification channel for Android (required for Android 8.0+)
  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel_id', // id
      'Channel Name', // title
      description: 'Channel for important notifications', // description
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      enableLights: true,
      showBadge: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Show Local Notification
  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      channelDescription: 'Channel for important notifications',
      importance: Importance.high,
      priority: Priority.high,
      visibility: NotificationVisibility.public, // Show on lock screen
      channelShowBadge: true,
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      styleInformation: BigTextStyleInformation(''),
      playSound: true,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      badgeNumber: 1,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'New Notification',
      message.notification?.body ?? 'You have a new message',
      platformChannelSpecifics,
      payload: message.data['screen'] ?? '',
    );
  }

  /// Handle Navigation for Notification Clicks
  void _navigateToScreen(RemoteMessage message) {
    // navigatorKey.currentState?.push(
    //   MaterialPageRoute(
    //     builder: (context) => NotificationScreen(),
    //   ),
    // );

    // Uncomment the above code and replace NotificationScreen with
    // your actual screen when you're ready to implement navigation
  }

  /// Handle Local Notification Clicks
  void _navigateToScreenFromLocal() {
    // navigatorKey.currentState?.push(
    //   MaterialPageRoute(
    //     builder: (context) => NotificationScreen(),
    //   ),
    // );

    // Uncomment the above code and replace NotificationScreen with
    // your actual screen when you're ready to implement navigation
  }
}
