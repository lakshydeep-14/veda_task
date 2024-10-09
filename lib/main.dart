import 'package:firebase_core/firebase_core.dart';
import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/config/di/get_injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const MultipleBlocProvidersClass(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _router = GoGoRouter().getRouter();
  }

  @override
  Widget build(BuildContext context) {
    context.statusBarColorWhite();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
    );
  }
}
