part of 'banner_bloc.dart';

abstract class BannerEvent {}

class GetBannerEvent extends BannerEvent {}

class BannerIndex extends BannerEvent {
  final int index;

  BannerIndex({required this.index});
}
