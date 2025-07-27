import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/Utils/app_formatter.dart';
import 'package:smile_fokus_test/bloc/wish_list/wish_lish_bloc.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';

class RewardInformation extends StatelessWidget {
  const RewardInformation({super.key, required this.model});

  final RewardItem model;

  @override
  Widget build(BuildContext context) {
    //Call function for display favorite icon
    bool isDisplayFavorite = _isFavorite(context);

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
            ///Build  Favorite icon
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 18,
              child: IconButton(
                icon: Icon(
                  isDisplayFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isDisplayFavorite ? kPrimaryOrange : kWhiteColor,
                  size: 18,
                ),
                onPressed: () {
                  ///Update wishList event
                  context.read<WishListBloc>().add(UpdateWishListEvent(model));
                },
              ),
            ),
            ///Build  Reward name
            title: Text(
              model.name,
              style: SetStyle.sarabunBold(AppFonts.superLarge),
              softWrap: true,
            ),
          ),


          ///Build Reward points
          Text(
            '${AppFormatter.formatNumber(model.rewardPoints)} ${GetString.points}',
            style: SetStyle.sarabunSemiBold(AppFonts.large),
          ),
          SizedBox(height: AppFonts.superLarge),
          ///Build Reward detail
          Text(
            GetString.detail,
            style: SetStyle.sarabunSemiBold(AppFonts.large),
          ),
          ///Build Reward description
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

  /// Check isFavorite Function
  bool _isFavorite(BuildContext context) {
    final wishListState = context.watch<WishListBloc>().state;

    if (wishListState is WishListUpdatedState) {
      return wishListState.modelList.any((item) => item.id == model.id);
    }
    return false;
  }
}
