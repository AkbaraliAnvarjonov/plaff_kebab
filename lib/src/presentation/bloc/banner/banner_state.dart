part of 'banner_bloc.dart';

class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object?> get props => [];
}

class GetBannerErrosState extends BannerState {
  final String error;
  const GetBannerErrosState({required this.error});

  @override
  List<Object?> get props => [error];
}

class GetBannerSuccesState extends BannerState {
  final List<BannerModel> bannerList;

  const GetBannerSuccesState({required this.bannerList});

  @override
  List<Object?> get props => [bannerList];
}

class GetBannerLoading extends BannerState {}
