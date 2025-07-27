import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/Utils/app_formatter.dart';
import 'package:smile_fokus_test/components/custom_button.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/repository/auth_repository.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({
    super.key,
    required this.userName,
    required this.currentPoint,
  });

  final String userName;
  final int currentPoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPaddings.large),
      child: Row(
        children: [
          /// Name and Point Ui
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${GetString.namePrefix} $userName',
                style: SetStyle.sarabunBold(AppFonts.large),
              ),
              Text(
                '${AppFormatter.formatNumber(currentPoint)} ${GetString.points}',
                style: SetStyle.sarabunSemiBold(AppFonts.large),
              ),
            ],
          ),
          ///Sign out Ui
          Expanded(
            child: CustomButton(
              padding: EdgeInsets.only(left: AppPaddings.large),
              textHeight: 35,
              text: GetString.signOut,
              bgColor: kPrimaryOrange,
              onPressed: () {
                AuthRepository.signOut(context);
              },
              textStyle: SetStyle.sarabunBold(
                AppFonts.medium,
              ).copyWith(color: kWhiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
