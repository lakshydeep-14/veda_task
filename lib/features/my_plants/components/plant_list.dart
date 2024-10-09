import 'package:veda_task/config/app_extensions.dart';

class PlantList extends StatefulWidget {
  const PlantList({super.key});

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      height: 190,
      width: context.deviceWidth,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ).copyWith(right: 15, left: i == 0 ? 18 : 0, bottom: 30),
              padding: const EdgeInsets.all(12),
              // height: 160,
              width: 0.85 * context.deviceWidth,
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
              child: Row(
                children: [
                  Image.asset(AppImagePath.alovera),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aloe Vera",
                          style: context.text.titleMedium!
                              .copyWith(fontFamily: AppBaseConfig.satoshiBold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'A plant with beautiful petal but protected with throne. Smell amazing with health benefit.....',
                          style: context.text.titleSmall!.copyWith(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Continue Reading >",
                          style: context.text.titleSmall!.copyWith(
                              color: AppColor.primary,
                              fontSize: 14,
                              fontFamily: AppBaseConfig.satoshiBold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
