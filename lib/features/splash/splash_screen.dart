import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/authentication/cubit/authentication_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthenticationCubit>().checkInitialStatus();
  }

  @override
  Widget build(BuildContext context) {
    context.statusBarColorWhite(isWhite: false);
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => context.push(Routes.splash.path),
          unAuthenticated: () => context.go(Routes.intro.path),
          authenticated: () => context.go(Routes.dashboard.path),
        );
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Center(
          child: SvgPicture.asset(AppImagePath.splash),
        ),
      ),
    );
  }
}
