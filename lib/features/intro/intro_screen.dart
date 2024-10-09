import 'dart:async';
import 'package:veda_task/config/app_extensions.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> _introTexts = [
    "Understand Your Plants",
    "Set Your Plant care Routine",
    "Explore Plant Lover Community",
    "Explore Online Marketplace Of Plants",
  ];
  List<String> displayedText = [];
  List<bool> isVisible = [];
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isVisible = List<bool>.filled(_introTexts.length, false);
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      if (currentIndex < _introTexts.length) {
        setState(() {
          displayedText.add(_introTexts[currentIndex]);
        });
        await Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            isVisible[currentIndex] = true;
          });
        });
        currentIndex++;
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0)
            .copyWith(top: context.devicePaddingTop + 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppImagePath.intro)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
              child: Text(
                "Your Ultimate Plant\nCare Companion!",
                textAlign: TextAlign.center,
                style: context.text.headlineMedium!.copyWith(
                    color: AppColor.primary,
                    fontFamily: AppBaseConfig.garamondFont,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ..._introTextWid(),
            const Spacer(
              flex: 2,
            ),
            _getStartedButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  List<Widget> _introTextWid() {
    return List.generate(displayedText.length, (i) {
      return AnimatedOpacity(
        opacity: isVisible[i] ? 1.0 : 0.0,
        duration: const Duration(seconds: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImagePath.tick),
            const SizedBox(
              width: 10,
            ),
            Text(
              displayedText[i],
              style: context.text.titleMedium!.copyWith(
                  fontFamily: AppBaseConfig.satoshiMedium, height: 2.5),
            ),
          ],
        ),
      );
    });
  }

  Widget _getStartedButton() => isVisible[3]
      ? AnimatedOpacity(
          opacity: isVisible[3] ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: CustomButton(
            onPressed: () {
              context.push(Routes.setupProfile.path);
            },
            horizontal: 18,
            prefixIcon: SvgPicture.asset(AppImagePath.getStarted),
            buttonText: "Get Started",
          ))
      : const SizedBox.shrink();
}
