import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/adress/branch_model.dart';
import 'package:plaff_kebab/src/domain/repositories/profile/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepsotory) : super(const ProfileState()) {
    on<BranchesEvent>(_getBranches);
  }
  ProfileRepsotory profileRepsotory;
  _getBranches(BranchesEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: BranchStatus.loading));

    final result = await profileRepsotory.getBranches();
    result.fold(
      (l) {
        emit(state.copyWith(error: l.toString(), status: BranchStatus.error));
      },
      (r) {
        emit(state.copyWith(branches: r, status: BranchStatus.success));
      },
    );
  }
}
