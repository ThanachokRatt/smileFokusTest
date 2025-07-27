import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';

class RewardList extends StatelessWidget {
  const RewardList({super.key, required this.modelList});

  final List<RewardItem> modelList;

  @override
  Widget build(BuildContext context) {
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
          return RewardCard(
            name: model.name,
            points: model.rewardPoints,
            imageUrl: model.imageUrl,
            onPressedCard: () {
              print('name = ${model.name} points = ${model.rewardPoints}');
            },
            onPressedLike: () {
              print('like Id = ${model.id}');
            },
          );
        },
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final String name;
  final int points;
  final String imageUrl;
  final void Function()? onPressedCard;
  final void Function()? onPressedLike;
  const RewardCard({
    super.key,
    required this.name,
    required this.points,
    required this.imageUrl,
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
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 18,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                "$points ${GetString.points}",
                style: SetStyle.sarabunSemiBold(AppFonts.medium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
