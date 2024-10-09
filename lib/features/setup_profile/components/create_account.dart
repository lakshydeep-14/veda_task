import 'package:veda_task/config/app_extensions.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: context.text.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.primary,
                    fontFamily: AppBaseConfig.garamondFont),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Done! Register your account to save your data.",
                style: context.text.titleSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Image.asset(AppImagePath.createAccount),
      ],
    );
  }
}
