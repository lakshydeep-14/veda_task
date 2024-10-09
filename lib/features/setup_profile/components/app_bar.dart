import 'package:veda_task/config/app_extensions.dart';

class SetUpProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;

  final VoidCallback? backBtnTap;

  const SetUpProfileAppBar({
    super.key,
    this.title,
    this.backBtnTap,
  });

  @override
  State<SetUpProfileAppBar> createState() => _SetUpProfileAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(65);
}

class _SetUpProfileAppBarState extends State<SetUpProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: widget.title,
        centerTitle: true,
        surfaceTintColor: AppColor.white,
        flexibleSpace:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 2,
            width: context.deviceWidth,
            color: AppColor.grey50,
          ),
        ]),
        toolbarHeight: 65,
        backgroundColor: AppColor.white,
        leading: GestureDetector(
          onTap: widget.backBtnTap,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(
              AppImagePath.backArrow,
              height: 14,
              width: 14,
            ),
          ),
        ));
  }
}
