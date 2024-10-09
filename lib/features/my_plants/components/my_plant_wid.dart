import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/components/plant_card.dart';
import 'package:veda_task/features/my_plants/cubit/get_plant_list_cubit/get_plant_list_cubit.dart';

class MyPlantWid extends StatefulWidget {
  const MyPlantWid({super.key});

  @override
  State<MyPlantWid> createState() => _MyPlantWidState();
}

class _MyPlantWidState extends State<MyPlantWid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Plants",
          style: context.text.titleMedium!
              .copyWith(fontFamily: AppBaseConfig.satoshiBold),
        ),
        BlocBuilder<GetPlantListCubit, GetPlantListState>(
          builder: (context, state) {
            return state.maybeWhen(
                success: (list) => SizedBox(
                      height: 300,
                      width: context.deviceWidth,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (context, i) {
                            return PlantCard(plant: list[i]);
                          }),
                    ),
                error: (e) => const ErrorWid(),
                orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        ),
      ],
    );
  }
}

class ErrorWid extends StatelessWidget {
  const ErrorWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Image.asset(AppImagePath.myplants),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          child: Text(
            "No plants added yet,\ncontinue adding to see them here",
            textAlign: TextAlign.center,
            style: context.text.titleLarge!.copyWith(
                fontFamily: AppBaseConfig.garamondMediumFont,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
