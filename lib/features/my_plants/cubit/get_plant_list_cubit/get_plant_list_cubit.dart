import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:veda_task/drift_database/db_connector.dart';
import 'package:veda_task/features/my_plants/model/get_plant_list_model.dart';

part 'get_plant_list_state.dart';
part 'get_plant_list_cubit.freezed.dart';

class GetPlantListCubit extends Cubit<GetPlantListState> {
  final PlantDatabase plantDatabase;
  GetPlantListCubit({required this.plantDatabase})
      : super(const GetPlantListState.initial());

  Future<void> getPlantList() async {
    emit(const Loading());
    // Future.delayed(Duration(seconds: 10));

    List<GetPlantListModel> clientDetailList = [];
    List<PlantDBData> clientData =
        await (plantDatabase.select(plantDatabase.plantDB)).get();
    for (var element in clientData) {
      clientDetailList.add(GetPlantListModel(
          id: element.id,
          name: element.name,
          price: element.price,
          desc: element.description,
          image: element.image,
          type: element.type));
    }

    if (clientDetailList.isNotEmpty) {
      emit(Success(clientDetailList));
    } else {
      emit(const Error("No data found."));
    }
  }
}
