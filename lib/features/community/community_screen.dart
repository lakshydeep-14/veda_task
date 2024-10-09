import 'package:veda_task/config/app_extensions.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Community Screen",
          style: context.text.headlineSmall!.copyWith(
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
            fontFamily: AppBaseConfig.garamondFont,
          ),
        ),
      ),
    );
  }
}
