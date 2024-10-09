import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/community/community_screen.dart';
import 'package:veda_task/features/my_plants/my_plants_screen.dart';
import 'package:veda_task/features/nursery/nursery_screen.dart';
import 'package:veda_task/features/profile/profile_screen.dart';

final List<(String, String, Widget)> bottomBaritem = [
  (AppImagePath.home, "Home", const MyPlantsScreen()),
  (AppImagePath.community, "Community", const CommunityScreen()),
  (AppImagePath.nursery, "Nursery", const NurseryScreen()),
  (AppImagePath.profile, "Profile", const ProfileScreen()),
];

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int)? onTap;
  const CustomBottomBar({super.key, required this.currentIndex, this.onTap});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        selectedLabelStyle: context.text.bodyMedium!.copyWith(
            fontFamily: AppBaseConfig.satoshiBold, color: AppColor.textColor),
        unselectedLabelStyle: context.text.bodyMedium!
            .copyWith(fontFamily: AppBaseConfig.satoshiBold),
        items: [
          ...bottomBaritem.map((e) => BottomNavigationBarItem(
              activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppColor.lightGreen,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(e.$1),
              ),
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(e.$1),
              ),
              label: e.$2))
        ]);
  }
}
