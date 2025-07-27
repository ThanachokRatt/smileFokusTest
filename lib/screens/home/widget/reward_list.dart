import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/Utils/app_formatter.dart';
import 'package:smile_fokus_test/bloc/wish_list/wish_lish_bloc.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';
import 'package:smile_fokus_test/screens/reward_detail/reward_detail_screen.dart';

class RewardList extends StatelessWidget {
  const RewardList({super.key, required this.modelList});

  final List<RewardItem> modelList;

  @override
  Widget build(BuildContext context) {
    ///Reward List Ui
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.68,
        ),
        itemCount: modelList.length,
        itemBuilder: (context, index) {
          final model = modelList![index];
          ///Reward card item Ui
          return RewardCard(
            name: model.name,
            points: model.rewardPoints,
            imageUrl: model.imageUrl,
            isFavorite: _isFavorite(context, model),
            onPressedCard: () {
              /// Navigate to Reward detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (RewardDetailScreen(model: model)),
                ),
              );
            },
            ///Update wish list
            onPressedLike: () {
              context.read<WishListBloc>().add(UpdateWishListEvent(model));
            },
          );
        },
      ),
    );
  }

  ///check display favorite
  bool _isFavorite(BuildContext context, RewardItem model) {
    final wishListState = context.watch<WishListBloc>().state;

    if (wishListState is WishListUpdatedState) {
      return wishListState.modelList.any((item) => item.id == model.id);
    }
    return false;
  }
}

class RewardCard extends StatelessWidget {
  final String name;
  final int points;
  final String imageUrl;
  final bool isFavorite;
  final void Function()? onPressedCard;
  final void Function()? onPressedLike;
  const RewardCard({
    super.key,
    required this.name,
    required this.points,
    required this.imageUrl,
    required this.isFavorite,
    required this.onPressedCard,
    required this.onPressedLike,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCard,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  ///Build Image form link
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ///Build Icon favorite
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 18,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? kPrimaryOrange : kWhiteColor,
                          size: 18,
                        ),
                        onPressed: onPressedLike,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppPaddings.small),
            ///Build Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPaddings.small),
              child: Text(
                name,
                style: SetStyle.sarabunSemiBold(AppFonts.medium),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            ///Build points
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                "${AppFormatter.formatNumber(points)} ${GetString.points}",
                style: SetStyle.sarabunSemiBold(AppFonts.medium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
