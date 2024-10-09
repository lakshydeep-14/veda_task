import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/community/community_screen.dart';
import 'package:veda_task/features/dashboard/dashboard.dart';
import 'package:veda_task/features/intro/intro_screen.dart';
import 'package:veda_task/features/my_plants/add_plant_screen.dart';
import 'package:veda_task/features/my_plants/model/get_plant_list_model.dart';
import 'package:veda_task/features/my_plants/plant_detail_screen.dart';
import 'package:veda_task/features/setup_profile/setup_profile_screen.dart';
import 'package:veda_task/features/splash/splash_screen.dart';

class GoGoRouter {
  GoRouter getRouter() {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: Routes.splash.path,
          name: Routes.splash.name,
          builder: (context, state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: Routes.intro.path,
          name: Routes.intro.name,
          builder: (context, state) {
            return const IntroScreen();
          },
        ),
        GoRoute(
          path: Routes.community.path,
          name: Routes.community.name,
          builder: (context, state) {
            return const CommunityScreen();
          },
        ),
        GoRoute(
          path: Routes.dashboard.path,
          name: Routes.dashboard.name,
          builder: (context, state) {
            return const Dashboard();
          },
        ),
        GoRoute(
          path: Routes.setupProfile.path,
          name: Routes.setupProfile.name,
          builder: (context, state) {
            return const SetupProfile();
          },
        ),
        GoRoute(
          path: Routes.addPlant.path,
          name: Routes.addPlant.name,
          builder: (context, state) {
            return const AddPlantScreen();
          },
        ),
        GoRoute(
          path: Routes.plantDetailScreen.path,
          name: Routes.plantDetailScreen.name,
          builder: (context, state) {
            return PlantDetailScreen(
              plant: state.extra as GetPlantListModel,
            );
          },
        ),
        GoRoute(
          path: Routes.undefined.path,
          name: Routes.undefined.name,
          builder: (context, state) {
            return const Scaffold(
              body: Center(
                child: Text("No routes defined."),
              ),
            );
          },
        ),
      ],
    );
  }
}
