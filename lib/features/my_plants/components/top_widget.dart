import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/components/good_morning_wid.dart';
import 'package:veda_task/features/my_plants/components/plant_list.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.42 * context.deviceHeight,
      width: context.deviceWidth,
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              AppImagePath.dashboardBg,
              fit: BoxFit.fill,
              height: 0.3 * context.deviceHeight,
            ),
          ),
          Positioned(
              top: context.devicePaddingTop + 20,
              left: 0,
              right: 0,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoodMorningWid(),
                  PlantList(),
                ],
              )),
        ],
      ),
    );
  }
}
