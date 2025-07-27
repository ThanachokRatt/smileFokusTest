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
    final currentPoint = context.watch<PointBloc>().state.points;
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
                  if (modelList != null && userName.isNotEmpty) ...[
                    UserInfoHeader(
                      userName: userName,
                      currentPoint: currentPoint,
                    ),
                    RewardList(modelList: modelList),
                  ] else
                    _buildErrorMessage(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _buildErrorMessage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 1.2),
      child: Center(
        child: Text(
          GetString.errorMessage,
          style: SetStyle.sarabunBold(AppFonts.large),
        ),
      ),
    );
  }
}
