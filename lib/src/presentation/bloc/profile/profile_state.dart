part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final List<Branch> branches;
  final String error;
  final BranchStatus status;

  const ProfileState({
    this.branches = const [],
    this.error = '',
    this.status = BranchStatus.initial,
  });

  ProfileState copyWith({
    List<Branch>? branches,
    String? error,
    BranchStatus? status,
  }) {
    return ProfileState(
      branches: branches ?? this.branches,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        branches,
        error,
        status,
      ];
}

enum BranchStatus {
  initial,
  loading,
  success,
  error,
}

extension BranchStatusX on BranchStatus {
  bool get isInitial => this == BranchStatus.initial;

  bool get isLoading => this == BranchStatus.loading;

  bool get isSuccess => this == BranchStatus.success;

  bool get isError => this == BranchStatus.error;
}
