import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_fokus_test/Utils/configuration.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFetchRewardItemListEvent>((event, emit) async {
      final userName = await Configuration.userName;

      emit(HomeSuccessState(modelList: rewardListMockData, userName: userName));
    });
  }

  final List<RewardItem> rewardListMockData = [
    RewardItem(
      id: 1,
      name: "Adidas Ultraboost Core Black",
      imageUrl: "https://picsum.photos/id/10/400/400",
      rewardPoints: 300,
      rewardDesc: "รองเท้าวิ่งยอดนิยม สวมใส่สบายสำหรับการออกกำลังกาย",
    ),
    RewardItem(
      id: 2,
      name: "Nike Air Max 270",
      imageUrl: "https://picsum.photos/id/20/400/400",
      rewardPoints: 280,
      rewardDesc: "ดีไซน์ล้ำสมัย พร้อมเทคโนโลยีรองรับแรงกระแทก",
    ),
    RewardItem(
      id: 3,
      name: "Apple AirPods Pro",
      imageUrl: "https://picsum.photos/id/30/400/400",
      rewardPoints: 4500,
      rewardDesc: "หูฟังไร้สายตัดเสียงรบกวน พร้อมเคสชาร์จ",
    ),
    RewardItem(
      id: 4,
      name: "Starbucks Gift Card - ฿200",
      imageUrl: "https://picsum.photos/id/40/400/400",
      rewardPoints: 150,
      rewardDesc:
          "บัตรของขวัญ Starbucks มูลค่า 200 บาท ใช้ได้ทุกสาขาทั่วไทย ไม่มีวันหมดอายุ",
    ),
    RewardItem(
      id: 5,
      name: "Xiaomi Mi Smart Band 7",
      imageUrl: "https://picsum.photos/id/50/400/400",
      rewardPoints: 12350,
      rewardDesc: "สมาร์ทแบนด์วัดการนอน ออกกำลังกาย และวัดชีพจร",
    ),
    RewardItem(
      id: 6,
      name: "Amazon Echo Dot (4th Gen)",
      imageUrl: "https://picsum.photos/id/60/400/400",
      rewardPoints: 10000,
      rewardDesc: "ลำโพงอัจฉริยะพร้อม Alexa ผู้ช่วยส่วนตัวสั่งงานด้วยเสียง",
    ),
  ];
}
