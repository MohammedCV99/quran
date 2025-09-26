import 'package:quran/Core/Assets/ConstAssets.dart';
import 'package:quran/Core/Assets/ImagesAssets.dart';

class OnBoradingModel {
  String IMGpath;
  String Title;
  String SubTitle;
  OnBoradingModel({
    required this.IMGpath,
    required this.Title,
    required this.SubTitle,
  });
}

List<OnBoradingModel> OnBoradingData = [
  OnBoradingModel(
    IMGpath: Imagesassets.Screen1_IMG,
    Title: AppConsts.Screen1_Title,
    SubTitle: AppConsts.Screen1_SubTitle,
  ),
  OnBoradingModel(
    IMGpath: Imagesassets.Screen2_IMG,
    Title: AppConsts.Screen2_Title,
    SubTitle: AppConsts.Screen2_SubTitle,
  ),
  OnBoradingModel(
    IMGpath: Imagesassets.Screen3_IMG,
    Title: AppConsts.Screen3_Title,
    SubTitle: AppConsts.Screen3_SubTitle,
  ),
  OnBoradingModel(
    IMGpath: Imagesassets.Screen4_IMG,
    Title: AppConsts.Screen4_Title,
    SubTitle: AppConsts.Screen4_SubTitle,
  ),
  OnBoradingModel(
    IMGpath: Imagesassets.Screen5_IMG,
    Title: AppConsts.Screen5_Title,
    SubTitle: AppConsts.Screen5_SubTitle,
  ),
];
