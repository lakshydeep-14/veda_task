import 'package:veda_task/config/app_extensions.dart';

class BellIcon extends StatelessWidget {
  const BellIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: AppColor.white,
      padding: const EdgeInsets.all(1),
      offset: const Offset(1, 5),
      label: CircleAvatar(
        radius: 8,
        backgroundColor: AppColor.white,
        child: Text(
          "3",
          style: context.text.titleSmall!.copyWith(
              color: AppColor.primary,
              fontSize: 12,
              fontFamily: AppBaseConfig.satoshiBold),
        ),
      ),
      child: Container(
        height: 54,
        width: 54,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.2), shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppImagePath.bell,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
