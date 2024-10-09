import 'package:bloc/bloc.dart';
import 'package:drift/isolate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:veda_task/drift_database/db_connector.dart';

part 'add_plant_state.dart';
part 'add_plant_cubit.freezed.dart';

class AddPlantCubit extends Cubit<AddPlantState> {
  final PlantDatabase plantDatabase;
  AddPlantCubit({required this.plantDatabase})
      : super(const AddPlantState.initial());
  Future<void> addPlantToDatabase(
    String name,
    String description,
    String type,
    String price,
    String image,
  ) async {
    try {
      emit(const Loading());
      int response = await plantDatabase.into(plantDatabase.plantDB).insert(
          PlantDBCompanion.insert(
              name: name,
              description: description,
              type: type,
              price: price,
              image: image));
      emit(Success(response));
    } catch (e) {
      if (e is DriftRemoteException) {
        if (e.toString().contains("2067")) {
          //2067 is code for row already exist
          emit(const Error("Already exist in collection"));
        } else {
          emit(Error(e.remoteCause.toString()));
        }
      } else {
        emit(Error(e.toString()));
      }
    }
  }
}
