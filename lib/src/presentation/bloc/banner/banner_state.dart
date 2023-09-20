part of 'banner_bloc.dart';

class BannerState extends Equatable {
  const BannerState({
    this.error = '',
    this.bannerList = const [],
    this.status = BannerStatus.initial,
    this.index = 0,
  });

  final String error;
  final List<BannerModel> bannerList;
  final BannerStatus status;
  final int index;
  @override
  List<Object?> get props => [error, bannerList, status, index];

  BannerState copyWith({
    String? error,
    List<BannerModel>? bannerList,
    BannerStatus? status,
    int? index,
  }) {
    return BannerState(
      error: error ?? this.error,
      bannerList: bannerList ?? this.bannerList,
      status: status ?? this.status,
      index: index ?? this.index,
    );
  }
}

enum BannerStatus {
  initial,
  loading,
  success,
  error,
}

extension BannerStatusX on BannerStatus {
  bool get isInitial => this == BannerStatus.initial;

  bool get isLoading => this == BannerStatus.loading;

  bool get isSuccess => this == BannerStatus.success;

  bool get isError => this == BannerStatus.error;
}
