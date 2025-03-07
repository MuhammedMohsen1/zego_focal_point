// Package imports:
import 'package:zego_uikit/zego_uikit.dart';

// Project imports:
import 'package:zego_uikit_prebuilt_call/src/deprecated/deprecated.dart';
import 'package:zego_uikit_prebuilt_call/src/invitation/config.defines.dart';

class ZegoCallInvitationConfig {
  ZegoCallInvitationConfig({
    this.permissions = const [
      ZegoCallInvitationPermission.camera,
      ZegoCallInvitationPermission.microphone,
    ],
  });

  /// If you want to a pure audio call with invitation without popping up
  /// camera permission requests, you can remove the camera in [permissions]
  /// and set [ZegoUIKitPrebuiltCallConfig turnOnCameraWhenJoining] to false
  ///
  /// ``` dart
  /// ZegoUIKitPrebuiltCallInvitationService().init(
  ///   ...
  ///   config: ZegoCallInvitationConfig(permissions: [
  ///     ZegoCallInvitationPermission.microphone,
  ///   ]),
  ///   requireConfig: (ZegoCallInvitationData data) {
  ///     ...
  ///     config.turnOnCameraWhenJoining = false;
  ///     ...
  ///   },
  /// );
  /// ```
  List<ZegoCallInvitationPermission> permissions;
}

class ZegoCallInvitationUIConfig {
  ZegoCallInvitationUIConfig({
    this.prebuiltWithSafeArea = true,
    this.callingBackgroundBuilder,
    ZegoCallButtonUIConfig? declineButton,
    ZegoCallButtonUIConfig? acceptButton,
    ZegoCallButtonUIConfig? cancelButton,
    ZegoCallInvitationNotifyPopUpUIConfig? popUp,
    @Deprecated('use declineButton.visible instead$deprecatedTipsV420')
    bool showDeclineButton = true,
    @Deprecated('use cancelButton.visible instead$deprecatedTipsV420')
    bool showCancelInvitationButton = true,
  })  : popUp = popUp ?? ZegoCallInvitationNotifyPopUpUIConfig(),
        declineButton = declineButton ??
            ZegoCallButtonUIConfig(
              visible: showDeclineButton,
            ),
        acceptButton = acceptButton ?? ZegoCallButtonUIConfig(),
        cancelButton = cancelButton ??
            ZegoCallButtonUIConfig(
              visible: showCancelInvitationButton,
            );

  /// does [ZegoUIKitPrebuiltCall] display with SafeArea or not
  bool prebuiltWithSafeArea;

  /// config of call invitation pop-up dialog
  ZegoCallInvitationNotifyPopUpUIConfig popUp;

  /// background builder, default is a image
  ZegoCallingBackgroundBuilder? callingBackgroundBuilder;

  /// decline button
  ZegoCallButtonUIConfig declineButton;

  /// accept button
  ZegoCallButtonUIConfig acceptButton;

  /// cancel button
  ZegoCallButtonUIConfig cancelButton;

  @override
  String toString() {
    return 'ZegoCallInvitationUIConfig:{'
        'prebuiltWithSafeArea:$prebuiltWithSafeArea, '
        'declineButton:$declineButton, '
        'acceptButton:$acceptButton, '
        'cancelButton:$cancelButton, '
        'callingBackgroundBuilder:$callingBackgroundBuilder, '
        '}';
  }
}

class ZegoCallInvitationNotificationConfig {
  ZegoCallInvitationNotificationConfig({
    this.iOSNotificationConfig,
    this.androidNotificationConfig,
  });

  ZegoCallIOSNotificationConfig? iOSNotificationConfig;
  ZegoCallAndroidNotificationConfig? androidNotificationConfig;

  @override
  String toString() {
    return 'ZegoCallInvitationNotificationConfig:{'
        'androidNotificationConfig:$androidNotificationConfig, '
        'iOSNotificationConfig:$iOSNotificationConfig, '
        '}';
  }
}

/// online call ringtone config
/// Note that it only works for online calls. If it is offline, please configure it in the zego console
class ZegoCallRingtoneConfig {
  /// callee ringtone on local side, please note that the resource needs to be configured in your flutter project
  /// example: "assets/ringtone/incomingCallRingtone.mp3"
  String? incomingCallPath;

  /// caller ringtone on local side, please note that the resource needs to be configured in your flutter project
  /// example: "assets/ringtone/outgoingCallRingtone.mp3"
  String? outgoingCallPath;

  ZegoCallRingtoneConfig({
    this.incomingCallPath,
    this.outgoingCallPath,
  });

  @override
  String toString() {
    return 'ZegoCallRingtoneConfig:{'
        'incomingCallPath:$incomingCallPath, '
        'outgoingCallPath:$outgoingCallPath, '
        '}';
  }
}

/// iOS notification config
class ZegoCallIOSNotificationConfig {
  String appName;

  /// is iOS sandbox or not
  bool? isSandboxEnvironment;

  /// Corresponding certificate index configured by zego console
  ZegoSignalingPluginMultiCertificate certificateIndex;

  /// Customizing the icon for the iOS CallKit lock screen interface
  ///
  /// Below, we will using the example of setting a CallKitIcon icon, to
  /// explain how to set the icon for the CallKit lock screen interface on iOS system .
  ///
  /// Place your icon file in the ios/Runner/Assets.xcassets/ folder, with the file name CallKitIcon.imageset.
  /// When calling ZegoUIKitPrebuiltCallInvitationService.init,
  /// configure the [iOSNotificationConfig.systemCallingIconName] parameter with the file name (without the file extension).
  ///
  /// such as :
  ///   iOSNotificationConfig: ZegoCallIOSNotificationConfig(
  ///     systemCallingIconName: 'CallKitIcon',
  ///   ),
  String systemCallingIconName;

  ZegoCallIOSNotificationConfig({
    this.appName = '',
    this.certificateIndex =
        ZegoSignalingPluginMultiCertificate.firstCertificate,
    this.isSandboxEnvironment,
    this.systemCallingIconName = '',
  });

  @override
  String toString() {
    return 'ZegoCallIOSNotificationConfig:{'
        'appName:$appName, '
        'certificateIndex:$certificateIndex, '
        'isSandboxEnvironment:$isSandboxEnvironment, '
        'systemCallingIconName:$systemCallingIconName, '
        '}';
  }
}

/// android notification config
class ZegoCallAndroidNotificationConfig {
  /// specify the channel id of notification, which is same in 'Zego Console'
  String channelID;

  /// specify the channel name of notification, which is same in 'Zego Console'
  String channelName;

  /// specify the icon file name id of notification,
  /// Additionally, you must place your icon file in the following path:
  /// ${project_root}/android/app/src/main/res/drawable/${icon}.png
  String? icon;

  /// specify the sound file name id of notification, which is same in 'Zego Console'.
  /// Additionally, you must place your audio file in the following path:
  /// ${project_root}/android/app/src/main/res/raw/${sound}.mp3
  String? sound;

  bool vibrate;

  /// specify the call id show or hide,
  bool callIDVisibility;

  /// only for offline call, displayed in full screen or not when the screen is locked, default value is false.
  ///
  ///  and THE IMPORTANT IS, if set [showFullScreen] on true,
  ///  you need set **android:launchMode="singleInstance"**
  ///  in `manifest/application/activity` node
  ///  of ${project_root}/android/app/src/main/AndroidManifest.xml
  bool showFullScreen;

  /// specify the channel id of message notification, which is same in 'Zego Console'
  String messageChannelID;

  /// specify the channel name of message notification, which is same in 'Zego Console'
  String messageChannelName;

  /// specify the icon file name id of message notification,
  /// Additionally, you must place your icon file in the following path:
  /// ${project_root}/android/app/src/main/res/drawable/${icon}.png
  String? messageIcon;

  /// specify the sound file name id of message notification, which is same in 'Zego Console'.
  /// Additionally, you must place your audio file in the following path:
  /// ${project_root}/android/app/src/main/res/raw/${sound}.mp3
  String? messageSound;

  bool messageVibrate;

  // If fullScreen is enabled, you can use this parameter to configure the background image
  // such as fullScreenBackground: 'assets/image/call.png'
  String? fullScreenBackground;

  ZegoCallAndroidNotificationConfig({
    this.channelID = 'CallInvitation',
    this.channelName = 'Call Invitation',
    this.icon = '',
    this.sound = '',
    this.vibrate = true,
    this.messageVibrate = false,
    this.callIDVisibility = true,
    this.showFullScreen = false,
    this.messageChannelID = 'Message',
    this.messageChannelName = 'Message',
    this.messageIcon = '',
    this.messageSound = '',
    this.fullScreenBackground = '',
  });

  @override
  toString() {
    return 'ZegoCallAndroidNotificationConfig:{'
        'channelID:$channelID, '
        'channelName:$channelName, '
        'icon:$icon, '
        'sound:$sound, '
        'vibrate:$vibrate, '
        'messageVibrate:$messageVibrate, '
        'callIDVisibility:$callIDVisibility, '
        'messageChannelID:$messageChannelID, '
        'messageChannelName:$messageChannelName, '
        'messageIcon:$messageIcon, '
        'messageSound:$messageSound, '
        '}';
  }
}
