import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/model/get_plant_list_model.dart';

class PlantCard extends StatelessWidget {
  final GetPlantListModel plant;
  final bool moveFurther;
  const PlantCard({super.key, required this.plant, this.moveFurther = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (moveFurther) {
          context.push(Routes.plantDetailScreen.path, extra: plant);
        } else {}
      },
      child: Container(
        height: 320,
        width: 220,
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
                height: 120,
                width: 220,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.name,
                    style: context.text.titleMedium!
                        .copyWith(fontFamily: AppBaseConfig.satoshiBold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    plant.type,
                    style: context.text.titleSmall!.copyWith(
                        fontFamily: AppBaseConfig.satoshiBold,
                        color: AppColor.grey500),
                  ),
                  Text(
                    "रु. ${plant.price}",
                    style: context.text.titleSmall!
                        .copyWith(fontFamily: AppBaseConfig.satoshiBold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${plant.desc} A plant with beautiful petal but protected with throne. Smell amazing with health benefit.....',
                    style: context.text.bodyLarge!.copyWith(),
                    maxLines: 2,
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
    );
  }
}
