import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/setup_profile/cubit/setup_profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: context.text.headlineSmall!.copyWith(
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
            fontFamily: AppBaseConfig.garamondFont,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: CustomButton(
                onPressed: () {
                  context.read<SetupProfileCubit>().signOut();
                  context.go(Routes.intro.path);
                },
                buttonText: "Log Out",
                buttonColor: Colors.red.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
