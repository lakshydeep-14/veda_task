part of 'add_plant_cubit.dart';

@freezed
class AddPlantState with _$AddPlantState {
  const factory AddPlantState.initial() = Initial;
  const factory AddPlantState.loading() = Loading;
  const factory AddPlantState.success(int primaryKey) = Success;
  const factory AddPlantState.error(String errorMessage) = Error;
}
