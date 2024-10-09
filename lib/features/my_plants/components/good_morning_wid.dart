import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/components/bell_icon.dart';

class GoodMorningWid extends StatefulWidget {
  const GoodMorningWid({super.key});

  @override
  State<GoodMorningWid> createState() => _GoodMorningWidState();
}

class _GoodMorningWidState extends State<GoodMorningWid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning,",
                    style: context.text.titleSmall!.copyWith(
                      color: const Color(0xffC0E9C4),
                      fontFamily: AppBaseConfig.satoshiMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Ranjit Shrestha",
                    style: context.text.headlineSmall!.copyWith(
                      color: const Color(0xffF9FAFB),
                      fontWeight: FontWeight.bold,
                      fontFamily: AppBaseConfig.garamondFont,
                    ),
                  ),
                ],
              ),
              const BellIcon()
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Today's facts",
            style: context.text.titleSmall!.copyWith(
                color: const Color(0xffF9FAFB),
                fontFamily: AppBaseConfig.satoshiMedium),
          ),
        ],
      ),
    );
  }
}
