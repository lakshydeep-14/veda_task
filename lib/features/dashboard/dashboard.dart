import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/dashboard/components/custom_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomBar(
          currentIndex: index,
          onTap: (v) {
            setState(() {
              index = v;
            });
          },
        ),
        body: bottomBaritem[index].$3);
  }
}
