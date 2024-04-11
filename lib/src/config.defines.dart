// Flutter imports:
import 'package:flutter/cupertino.dart';
// Package imports:
import 'package:zego_uikit/zego_uikit.dart';

typedef ZegoCallAudioVideoContainerBuilder = Widget Function(
  BuildContext,
  List<ZegoUIKitUser> allUsers,
  List<ZegoUIKitUser> audioVideoUsers,
);

///  the configuration for the hang-up confirmation dialog
/// You can use the [ZegoUIKitPrebuiltCallConfig].[hangUpConfirmDialogInfo] property to set the properties inside this class.
class ZegoCallHangUpConfirmDialogInfo {
  /// The title of the dialog
  String title;

  /// The message content of the dialog
  String message;

  /// The text for the cancel button
  String cancelButtonName;

  /// The text for the confirm button
  String confirmButtonName;

  ZegoCallHangUpConfirmDialogInfo({
    this.title = 'Hangup Confirmation',
    this.message = 'Do you want to hangup?',
    this.cancelButtonName = 'Cancel',
    this.confirmButtonName = 'OK',
  });
}

