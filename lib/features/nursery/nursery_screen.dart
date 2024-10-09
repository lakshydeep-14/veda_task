import 'package:veda_task/config/app_extensions.dart';

class NurseryScreen extends StatefulWidget {
  const NurseryScreen({super.key});

  @override
  State<NurseryScreen> createState() => _NurseryScreenState();
}

class _NurseryScreenState extends State<NurseryScreen> {
  @override
  Widget build(BuildContext context) {
    context.statusBarColorWhite(isWhite: true);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                // color: AppColor.white,
                size: 18,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18.0)
                .copyWith(top: context.devicePaddingTop + 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Nurseries\nbased on your location",
                style: context.text.headlineSmall!.copyWith(
                    fontFamily: AppBaseConfig.garamondBoldFont,
                    color: AppColor.primary),
              ),
            ])));
  }
}
