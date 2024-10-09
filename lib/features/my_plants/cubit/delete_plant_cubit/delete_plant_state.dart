part of 'delete_plant_cubit.dart';

@freezed
class DeletePlantState with _$DeletePlantState {
  const factory DeletePlantState.initial() = Initial;
  const factory DeletePlantState.loading() = Loading;
  const factory DeletePlantState.success(String msg) = Success;
  const factory DeletePlantState.error(String errorMessage) = Error;
}
