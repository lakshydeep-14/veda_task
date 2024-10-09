import 'package:veda_task/config/app_extensions.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final double borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double verticle;
  final double? horizontal;
  final Widget? prefixIcon;
  final BorderSide? borderSide;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.borderSide,
    this.borderRadius = 18,
    this.horizontal,
    this.fontSize,
    this.fontWeight,
    this.verticle = 10.0,
    this.prefixIcon,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: widget.verticle, horizontal: widget.horizontal ?? 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: widget.borderColor ?? const Color(0xff0C3211),
            width: 3.0,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          context.hideKeyboard();
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              side: widget.borderSide ?? BorderSide.none,
              borderRadius:
                  BorderRadius.circular(widget.borderRadius), // Rounded corners
            ),
            backgroundColor: widget.buttonColor ?? AppColor.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.prefixIcon ?? const SizedBox.shrink(),
            widget.prefixIcon != null
                ? const SizedBox(
                    width: 10,
                  )
                : const SizedBox.shrink(),
            Text(
              widget.buttonText,
              style: context.text.titleMedium!.copyWith(
                  color: widget.textColor ?? AppColor.white,
                  fontFamily: AppBaseConfig.satoshiMedium),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
