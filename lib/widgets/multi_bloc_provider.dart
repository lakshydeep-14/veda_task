import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/config/di/get_injectable.dart';
import 'package:veda_task/drift_database/db_connector.dart';
import 'package:veda_task/features/authentication/cubit/authentication_cubit.dart';
import 'package:veda_task/features/my_plants/cubit/add_plant_cubit/add_plant_cubit.dart';
import 'package:veda_task/features/my_plants/cubit/delete_plant_cubit/delete_plant_cubit.dart';
import 'package:veda_task/features/my_plants/cubit/get_plant_list_cubit/get_plant_list_cubit.dart';
import 'package:veda_task/features/setup_profile/cubit/setup_profile_cubit.dart';

class MultipleBlocProvidersClass extends StatelessWidget {
  final Widget child;
  const MultipleBlocProvidersClass({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SetupProfileCubit>(
          create: (context) => SetupProfileCubit(),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<GetPlantListCubit>(
          create: (context) =>
              GetPlantListCubit(plantDatabase: locator<PlantDatabase>()),
        ),
        BlocProvider<AddPlantCubit>(
          create: (context) =>
              AddPlantCubit(plantDatabase: locator<PlantDatabase>()),
        ),
        BlocProvider<DeletePlantCubit>(
          create: (context) =>
              DeletePlantCubit(plantDatabase: locator<PlantDatabase>()),
        ),
      ],
      child: child,
    );
  }
}
