import '../../app_extensions.dart'; // Assuming this contains AppBaseConfig, AppFontSize, and AppColor

class AppTextStyle {
  AppTextStyle._();

  static TextTheme getLightTextTheme() => TextTheme(
        displaySmall: fs42(),
        headlineLarge: fs40(),
        headlineMedium: fs32(),
        headlineSmall: fs24(),
        titleLarge: fs20(),
        titleMedium: fs18(),
        titleSmall: fs16(),
        bodyLarge: fs14(),
        bodyMedium: fs12(),
        bodySmall: fs11(),
        labelLarge: fs10(),
      );

  static TextStyle _baseHeadline() => TextStyle(
        fontFamily: AppBaseConfig.satoshiRegular,
        color: AppColor.textColor,
        height: 1.2,
        letterSpacing: 0.8,
        fontWeight: FontWeight.w500,
      );

  static TextStyle fs42() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs42,
      );
  static TextStyle fs40() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs40,
      );
  static TextStyle fs32() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs32,
      );
  static TextStyle fs24() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs24,
      );
  static TextStyle fs20() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs20,
      );
  static TextStyle fs18() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs18,
      );
  static TextStyle fs16() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs16,
      );
  static TextStyle fs14() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs14,
      );
  static TextStyle fs12() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs12,
      );
  static TextStyle fs11() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs11,
      );
  static TextStyle fs10() => _baseHeadline().copyWith(
        fontSize: AppFontSize.fs10,
      );
}
