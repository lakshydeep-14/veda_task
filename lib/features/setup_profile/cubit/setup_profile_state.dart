part of 'setup_profile_cubit.dart';

@freezed
class SetupProfileState with _$SetupProfileState {
  const factory SetupProfileState.initial() = _Initial;
  const factory SetupProfileState.loading() = Loading;
  const factory SetupProfileState.success(User user) = Success;
  const factory SetupProfileState.error(String e) = Error;
}
