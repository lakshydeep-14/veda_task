part of 'get_plant_list_cubit.dart';

@freezed
class GetPlantListState with _$GetPlantListState {
  const factory GetPlantListState.initial() = Initial;
  const factory GetPlantListState.loading() = Loading;
  const factory GetPlantListState.success(List<GetPlantListModel> model) =
      Success;
  const factory GetPlantListState.error(String errorMessage) = Error;
}
