import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/Utils/app_formatter.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';

class RewardInformation extends StatelessWidget {
  const RewardInformation({super.key, required this.model});

  final RewardItem model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppPaddings.large,
        right: AppPaddings.large,
        bottom: AppPaddings.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 18,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {
                  print('tap favorite like');
                },
              ),
            ),
            title: Text(
              model.name,
              style: SetStyle.sarabunBold(AppFonts.superLarge),
              softWrap: true,
            ),
          ),
          Text(
            '${AppFormatter.formatNumber(model.rewardPoints)} ${GetString.points}',
            style: SetStyle.sarabunSemiBold(AppFonts.large),
          ),
          SizedBox(height: AppFonts.superLarge),
          Text(
            GetString.detail,
            style: SetStyle.sarabunSemiBold(AppFonts.large),
          ),

          Text(
            model.rewardDesc,
            style: SetStyle.sarabunRegular(
              AppFonts.medium,
            ).copyWith(color: kPrimaryGray),
          ),
        ],
      ),
    );
  }
}
