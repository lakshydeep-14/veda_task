import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/setup_profile/cubit/setup_profile_cubit.dart';

class FullNameScreen extends StatefulWidget {
  const FullNameScreen({super.key});

  @override
  State<FullNameScreen> createState() => _FullNameScreenState();
}

class _FullNameScreenState extends State<FullNameScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Full Name",
          style: context.text.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColor.primary,
              fontFamily: AppBaseConfig.garamondFont),
        ),
        TextFormField(
          controller: context.watch<SetupProfileCubit>().nameController,
          autofocus: true,
          style: context.text.headlineSmall!.copyWith(
              fontFamily: AppBaseConfig.garamondFont,
              fontWeight: FontWeight.bold),
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
