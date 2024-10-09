import '../../app_extensions.dart';

class AppTheme {
  AppTheme._();
  static ThemeData light() {
    return ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        textTheme: AppTextStyle.getLightTextTheme(),
        fontFamily: AppBaseConfig.satoshiRegular,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
        ),
        datePickerTheme: DatePickerThemeData(
            dayStyle: AppTextStyle.getLightTextTheme().titleMedium,
            yearStyle: AppTextStyle.getLightTextTheme().titleMedium!,
            dividerColor: AppColor.primary,
            headerBackgroundColor: AppColor.primary,
            headerForegroundColor: AppColor.white,
            cancelButtonStyle: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(AppColor.primary)),
            headerHeadlineStyle: AppTextStyle.getLightTextTheme()
                .headlineMedium!
                .copyWith(
                    color: AppColor.white,
                    fontFamily: AppBaseConfig.satoshiRegular),
            headerHelpStyle: AppTextStyle.getLightTextTheme()
                .titleMedium!
                .copyWith(
                    color: AppColor.white,
                    fontFamily: AppBaseConfig.satoshiRegular),
            yearOverlayColor: WidgetStateProperty.all(AppColor.primary),
            weekdayStyle: AppTextStyle.getLightTextTheme()
                .titleMedium!
                .copyWith(
                    color: AppColor.primary,
                    fontFamily: AppBaseConfig.satoshiRegular)),
        buttonTheme: const ButtonThemeData(buttonColor: AppColor.primary),
        radioTheme: const RadioThemeData(
            fillColor: WidgetStatePropertyAll<Color>(AppColor.primary)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColor.primary, foregroundColor: AppColor.white),
        iconTheme: const IconThemeData(color: AppColor.primary),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.primary,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColor.primary, size: 35)));
  }
}
