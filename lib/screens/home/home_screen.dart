import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/bloc/Home/home_bloc.dart';
import 'package:smile_fokus_test/bloc/Home/point/point_bloc.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';
import 'package:smile_fokus_test/screens/home/widget/reward_list.dart';
import 'package:smile_fokus_test/screens/home/widget/user_info_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Check current point.
    final currentPoint = context.watch<PointBloc>().state.points;

    //Retrieve reward item list mock data.
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeFetchRewardItemListEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          List<RewardItem>? modelList;
          String userName = '';
          if (state is HomeSuccessState) {
            modelList = state.modelList;
            userName = state.userName;
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Build RewardList Ui
                  if (modelList != null && userName.isNotEmpty) ...[
                    UserInfoHeader(
                      userName: userName,
                      currentPoint: currentPoint,
                    ),
                    RewardList(modelList: modelList),
                  ] else
                    ///Build ErrorMessage Ui
                    _buildErrorMessage(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded _buildErrorMessage(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          GetString.errorHomeMessage,
          style: SetStyle.sarabunRegular(AppFonts.large),
        ),
      ),
    );
  }
}
