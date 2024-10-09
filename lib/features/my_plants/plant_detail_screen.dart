import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/cubit/delete_plant_cubit/delete_plant_cubit.dart';
import 'package:veda_task/features/my_plants/cubit/get_plant_list_cubit/get_plant_list_cubit.dart';
import 'package:veda_task/features/my_plants/model/get_plant_list_model.dart';

class PlantDetailScreen extends StatefulWidget {
  final GetPlantListModel plant;
  const PlantDetailScreen({super.key, required this.plant});

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SvgPicture.asset(
            AppImagePath.backArrow,
            height: 14,
            width: 14,
          ),
        ),
      )),
      body: BlocListener<DeletePlantCubit, DeletePlantState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              error: (e) => NewToastUtils.showErrorToast(e),
              success: (m) {
                NewToastUtils.showSuccessToast(m);
                context.read<GetPlantListCubit>().getPlantList();
                context.pop();
              });
        },
        child: Column(
          children: [
            Container(
              height: 350,
              width: context.deviceWidth,
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff0000000).withOpacity(0.08),
                        blurRadius: 18,
                        spreadRadius: 0,
                        offset: const Offset(
                          0,
                          4,
                        ))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    child: Image.network(
                      'https://res.cloudinary.com/patch-gardens/image/upload/c_fill,h_1000,q_auto:good,w_1000/Group_Baskets_InSitu_CROP_s5lzh5.jpg',
                      height: 200,
                      width: context.deviceWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plant.name,
                          style: context.text.titleMedium!
                              .copyWith(fontFamily: AppBaseConfig.satoshiBold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.plant.desc} A plant with beautiful petal but protected with throne. Smell amazing with health benefit.....',
                          style: context.text.titleSmall!.copyWith(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Continue Reading >",
                          style: context.text.titleSmall!.copyWith(
                              color: AppColor.primary,
                              fontSize: 14,
                              fontFamily: AppBaseConfig.satoshiBold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
              child: CustomButton(
                  onPressed: () {
                    context.read<DeletePlantCubit>().delPlant(widget.plant.id);
                  },
                  buttonText: "Delete"),
            )
          ],
        ),
      ),
    );
  }
}
