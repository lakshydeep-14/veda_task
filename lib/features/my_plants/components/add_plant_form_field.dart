import 'package:veda_task/config/app_extensions.dart';

class AddPlantFormField extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  const AddPlantFormField(
      {super.key, required this.label, required this.textEditingController});

  @override
  State<AddPlantFormField> createState() => _AddPlantFormFieldState();
}

class _AddPlantFormFieldState extends State<AddPlantFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.text.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColor.primary,
              fontFamily: AppBaseConfig.garamondFont),
        ),
        TextFormField(
          controller: widget.textEditingController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Required';
              // return 'Please enter your organization name';
            }
            return null;
          },
          scrollPadding:
              EdgeInsets.symmetric(vertical: context.bottomViewInsets + 30),
          style: context.text.titleMedium!.copyWith(
              fontFamily: AppBaseConfig.garamondFont,
              fontWeight: FontWeight.bold),
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary, width: 1.0),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
