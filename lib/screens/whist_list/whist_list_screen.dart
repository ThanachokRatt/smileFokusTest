import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/bloc/wish_list/wish_lish_bloc.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/screens/home/widget/reward_list.dart';

class WhistListScreen extends StatelessWidget {
  const WhistListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final whistListState = context.watch<WishListBloc>().state;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppPaddings.large),
        child: Column(
          children: [
            ///Build Reward list from whist list bloc
            if (whistListState is WishListUpdatedState &&
                whistListState.modelList.isNotEmpty)
              RewardList(modelList: whistListState.modelList)
            else
              ///Build is empty whist list message
              Expanded(
                child: Center(
                  child: Text(
                    GetString.errorWhistListMessage,
                    style: SetStyle.sarabunRegular(AppFonts.large),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
