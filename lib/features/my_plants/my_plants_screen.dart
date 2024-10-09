import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/components/my_plant_wid.dart';
import 'package:veda_task/features/my_plants/components/top_widget.dart';
import 'package:veda_task/features/my_plants/cubit/get_plant_list_cubit/get_plant_list_cubit.dart';

class MyPlantsScreen extends StatefulWidget {
  const MyPlantsScreen({super.key});

  @override
  State<MyPlantsScreen> createState() => _MyPlantsScreenState();
}

class _MyPlantsScreenState extends State<MyPlantsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetPlantListCubit>().getPlantList();
  }

  @override
  Widget build(BuildContext context) {
    context.statusBarColorWhite(isWhite: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            context.push(Routes.addPlant.path);
          },
          child: const FaIcon(FontAwesomeIcons.plus)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0)
                  .copyWith(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyPlantWid(),
                  _button(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: CustomButton(
                buttonColor: AppColor.lightGreen,
                borderColor: const Color(0xffBAD8A0),
                textColor: AppColor.primary,
                onPressed: () {},
                buttonText: 'Visit Nursery')),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: CustomButton(
                buttonColor: AppColor.lightGreen,
                borderColor: const Color(0xffBAD8A0),
                textColor: AppColor.primary,
                onPressed: () {
                  context.push(Routes.addPlant.path);
                },
                buttonText: 'Add Plant')),
      ],
    );
  }
}
