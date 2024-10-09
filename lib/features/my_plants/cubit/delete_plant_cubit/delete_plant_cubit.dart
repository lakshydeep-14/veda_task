import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:veda_task/drift_database/db_connector.dart';

part 'delete_plant_state.dart';
part 'delete_plant_cubit.freezed.dart';

class DeletePlantCubit extends Cubit<DeletePlantState> {
  final PlantDatabase plantDatabase;
  DeletePlantCubit({required this.plantDatabase})
      : super(const DeletePlantState.initial());

  Future<void> delPlant(int id) async {
    emit(const Loading());
    // Future.delayed(Duration(seconds: 10));

    try {
      await (plantDatabase.delete(plantDatabase.plantDB)
            ..where((tbl) => tbl.id.equals(id)))
          .go();
      emit(const Success("Successfully deleted."));
    } catch (e) {
      emit(const Error("No data found."));
    }
  }
}
