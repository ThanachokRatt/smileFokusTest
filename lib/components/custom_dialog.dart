import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';

class CustomDialog {
  static showDialogInfo({
    required BuildContext context,
    required String alertDescription,
    VoidCallback? onPressed,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            GetString.alertTitle,
            style: SetStyle.sarabunBold(AppFonts.large),
          ),
          content: Text(
            alertDescription,
            style: SetStyle.sarabunRegular(AppFonts.medium),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                GetString.close,
                style: SetStyle.sarabunRegular(
                  AppFonts.large,
                ).copyWith(color: kBlueIosDialog),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showConfirmDialog({
    required BuildContext context,
    required String alertDescription,
    required VoidCallback onSave,
  }) async {
    return showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            GetString.alertTitle,
            style: SetStyle.sarabunBold(
              AppFonts.large,
            ).copyWith(height: 1.6, color: kSolidBlack),
          ),
          content: Text(
            alertDescription,
            style: SetStyle.sarabunRegular(14).copyWith(height: 1.6),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                GetString.cancel,
                style: SetStyle.sarabunRegular(16).copyWith(color: kSolidBlack),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(
                GetString.confirm,
                style: SetStyle.sarabunRegular(
                  16,
                ).copyWith(color: kBlueIosDialog),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onSave();
              },
            ),
          ],
        );
      },
    );
  }
}
