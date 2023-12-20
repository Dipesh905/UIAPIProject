import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/controller/resources/images.dart';
import 'package:uiapiapp/model/deposit_model.dart';

List<DepositModel> deposits = [
  DepositModel(
      amount: 7890,
      bankName: "BCA",
      depositSuccessColor: AppColor.successfulColorInBlack,
      bankImage: AppImage.ledDisplay),
  DepositModel(
      amount: 2434,
      bankName: "Asia",
      depositSuccessColor: AppColor.lightPinkColor,
      bankImage: AppImage.student),
  DepositModel(
      amount: 1094,
      bankName: 'Sonali',
      depositSuccessColor: AppColor.lightBlueColor,
      bankImage: AppImage.threeDotImage),
  DepositModel(
      amount: 7402,
      bankName: 'Sonali',
      depositSuccessColor: AppColor.lightPurpleColor,
      bankImage: AppImage.ledDisplay),
  DepositModel(
      amount: 1234,
      bankName: 'Nbank',
      depositSuccessColor: AppColor.lightPurpleColor,
      bankImage: AppImage.student),
  DepositModel(
      amount: 1094,
      bankName: 'Sonali',
      depositSuccessColor: AppColor.lightBlueColor,
      bankImage: AppImage.threeDotImage),
];
