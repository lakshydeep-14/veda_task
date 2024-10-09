import 'package:advanced_rich_text/advanced_rich_text.dart';
import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/setup_profile/components/app_bar.dart';
import 'package:veda_task/features/setup_profile/components/create_account.dart';
import 'package:veda_task/features/setup_profile/components/full_name.dart';
import 'package:veda_task/features/setup_profile/components/top_priority.dart';
import 'package:veda_task/features/setup_profile/cubit/setup_profile_cubit.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final List<Widget> _setupProfileWidgets = [
    const FullNameScreen(),
    const TopPriorityScreen(),
    const CreateAccount()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SetupProfileCubit, SetupProfileState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loading: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text("Setting up your accounts..."),
                    );
                  });
            },
            error: (e) {
              context.pop();
              NewToastUtils.showErrorToast(e);
            },
            success: (u) {
              context.pop();
              context.go(Routes.dashboard.path);
            });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SetUpProfileAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ..._setupProfileWidgets.map((e) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _setupProfileWidgets.indexOf(e) <= index
                            ? AppColor.primary
                            : const Color(0xffd2f5d6)),
                  ))
            ],
          ),
          backBtnTap: () {
            if (index > 0) {
              setState(() {
                index--;
              });
            } else {
              context.pop();
            }
          },
        ),
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.hideKeyboard();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: index == 2 ? 0 : 18.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _setupProfileWidgets[index],
                  const Spacer(),
                  _button(),
                ],
              ),
            )),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: index == 2
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    context.read<SetupProfileCubit>().signInWithGoogle();
                  },
                  buttonColor: AppColor.lightGreen,
                  borderColor: const Color(0xffBAD8A0),
                  textColor: AppColor.textColor,
                  buttonText: "Create with Google",
                  prefixIcon: Image.asset(
                    AppImagePath.google,
                    height: 32,
                    width: 32,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 40)
                        .copyWith(bottom: 40),
                    child: AdvanceRichText(
                      initialText: 'By continuing, you agree to Plant Pal ',
                      initialTextStyle: context.text.titleSmall!
                          .copyWith(fontFamily: AppBaseConfig.satoshiMedium),
                      textList: [
                        TextSpanList(
                            text: "Privacy Policy ",
                            textStyle: context.text.titleSmall!.copyWith(
                                decoration: TextDecoration.underline)),
                        TextSpanList(
                          text: "and ",
                          textStyle: context.text.titleSmall!.copyWith(
                              fontFamily: AppBaseConfig.satoshiMedium),
                        ),
                        TextSpanList(
                            text: "Terms of Use",
                            textStyle: context.text.titleSmall!
                                .copyWith(decoration: TextDecoration.underline))
                      ],
                    ),
                  ),
                )
              ],
            )
          : CustomButton(
              onPressed: () async {
                if (index == 0 &&
                    context
                        .read<SetupProfileCubit>()
                        .nameController
                        .text
                        .isNotEmpty) {
                  setState(() {
                    index++;
                  });
                } else if (index == 1 &&
                    context.read<SetupProfileCubit>().selectedPriority != 0) {
                  setState(() {
                    index++;
                  });
                } else if (index == 2) {
                } else {
                  NewToastUtils.showErrorToast("Please fill data");
                }
              },
              buttonText: "Next"),
    );
  }
}
