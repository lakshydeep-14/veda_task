import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/setup_profile/cubit/setup_profile_cubit.dart';
import 'package:veda_task/features/setup_profile/model/priority_model.dart';

class TopPriorityScreen extends StatefulWidget {
  const TopPriorityScreen({super.key});

  @override
  State<TopPriorityScreen> createState() => _TopPriorityScreenState();
}

class _TopPriorityScreenState extends State<TopPriorityScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Top Priority",
        style: context.text.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColor.primary,
            fontFamily: AppBaseConfig.garamondFont),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        "Choose the feature that is most essential for you.",
        style: context.text.titleSmall!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      ...priorityList.map((e) => Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: const Color(0xffFEFEFE),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff0000000).withOpacity(0.05),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: const Offset(
                        0,
                        1,
                      ))
                ],
                border: Border.all(width: 1, color: const Color(0xffF9FAFB)),
                borderRadius: BorderRadius.circular(4)),
            child: ListTile(
                onTap: () {
                  setState(() {
                    context.read<SetupProfileCubit>().selectedPriority = e.id;
                  });
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                minTileHeight: 60,
                leading: Image.asset(
                  e.image,
                  color: AppColor.black,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  e.priorityName,
                  style: context.text.titleMedium!
                      .copyWith(fontFamily: AppBaseConfig.satoshiMedium),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        context.read<SetupProfileCubit>().selectedPriority =
                            e.id;
                      });
                    },
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        color: context
                                    .read<SetupProfileCubit>()
                                    .selectedPriority ==
                                e.id
                            ? AppColor.primary
                            : AppColor.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context
                                      .read<SetupProfileCubit>()
                                      .selectedPriority ==
                                  e.id
                              ? AppColor.primary
                              : AppColor.grey400, // Border color
                          width: 1.0,
                        ),
                      ),
                      child:
                          context.read<SetupProfileCubit>().selectedPriority ==
                                  e.id
                              ? const Icon(
                                  Icons.check,
                                  size: 16.0,
                                  color: AppColor.white, // Tick color
                                )
                              : null,
                    ))),
          ))
    ]);
  }
}
