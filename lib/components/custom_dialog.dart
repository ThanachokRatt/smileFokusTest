import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';

showDialogInfo({
  required BuildContext context,
  required String alertDescription,
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
            },
          ),
        ],
      );
    },
  );
}
