import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/Utils/app_formatter.dart';
import 'package:smile_fokus_test/bloc/Home/point/point_bloc.dart';
import 'package:smile_fokus_test/bloc/reward_detail/disable_btn/disable_redeem_btn_cubit.dart';
import 'package:smile_fokus_test/components/custom_button.dart';
import 'package:smile_fokus_test/components/custom_dialog.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';
import 'package:smile_fokus_test/screens/reward_detail/widget/reward_information.dart';

class RewardDetailScreen extends StatelessWidget {
  final RewardItem model;
  const RewardDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final currentPoint = context.watch<PointBloc>().state.points;
    return BlocProvider(
      create: (context) {
        final cubit = DisableRedeemBtnCubit();
        cubit.disableRedeemEvent(
          currentPoint < model.rewardPoints ? true : false,
        );
        return cubit;
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(backgroundColor: kWhiteColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildRewardImage(model: model),
              RewardInformation(model: model),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigatorBar(model: model),
      ),
    );
  }
}

class _buildBottomNavigatorBar extends StatelessWidget {
  const _buildBottomNavigatorBar({super.key, required this.model});

  final RewardItem model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppPaddings.medium),
        child: BlocBuilder<DisableRedeemBtnCubit, DisableRedeemBtnState>(
          builder: (context, state) {
            bool isDisable = false;

            if (state is DisableRedeemState) {
              isDisable = state.isDisable;
            }
            return CustomButton(
              text: GetString.redeem,
              bgColor: isDisable ? kPrimaryGray : kPrimaryOrange,
              onPressed: () {
                isDisable
                    ? null
                    : CustomDialog.showConfirmDialog(
                        context: context,
                        alertDescription: GetString.confirmRedemption,
                        onSave: () {
                          context.read<PointBloc>().add(
                            UpdatePointsEvent(model.rewardPoints),
                          );
                          CustomDialog.showDialogInfo(
                            context: context,
                            alertDescription: GetString.redemptionComplete,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
              },
              textStyle: SetStyle.sarabunBold(
                AppFonts.large,
              ).copyWith(color: kWhiteColor),
            );
          },
        ),
      ),
    );
  }
}

class _buildRewardImage extends StatelessWidget {
  const _buildRewardImage({super.key, required this.model});

  final RewardItem model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.2,
      child: Image.network(
        model.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
