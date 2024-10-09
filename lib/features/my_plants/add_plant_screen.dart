import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/my_plants/components/add_plant_form_field.dart';
import 'package:veda_task/features/my_plants/cubit/add_plant_cubit/add_plant_cubit.dart';
import 'package:veda_task/features/my_plants/cubit/get_plant_list_cubit/get_plant_list_cubit.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  String? selectedImage;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    typeController.dispose();
    priceController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add Plant",
            style: context.text.headlineSmall!.copyWith(
                fontFamily: AppBaseConfig.garamondFont,
                color: AppColor.primary,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          surfaceTintColor: AppColor.white,
          flexibleSpace:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              height: 2,
              width: context.deviceWidth,
              color: AppColor.grey50,
            ),
          ]),
          toolbarHeight: 65,
          backgroundColor: AppColor.white,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                AppImagePath.backArrow,
                height: 14,
                width: 14,
              ),
            ),
          )),
      body: BlocListener<AddPlantCubit, AddPlantState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              success: (k) {
                NewToastUtils.showSuccessToast("Plant saved to database");
                context.read<GetPlantListCubit>().getPlantList();
                context.pop();
              });
        },
        child: Form(
          key: _formKey,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.hideKeyboard();
            },
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddPlantFormField(
                    label: "Name",
                    textEditingController: nameController,
                  ),
                  AddPlantFormField(
                    label: "Type",
                    textEditingController: typeController,
                  ),
                  AddPlantFormField(
                    label: "Price",
                    textEditingController: priceController,
                  ),
                  AddPlantFormField(
                    label: "Description",
                    textEditingController: descriptionController,
                  ),
                  selectedImage != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: SizedBox(
                            height: 100,
                            child: SelectedFilesDisplayWidgetHomework(
                              filePath: selectedImage!,
                              onTap: () {
                                setState(() {
                                  selectedImage = null;
                                });
                              },
                            ),
                          ),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () async {
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (photo != null) {
                        setState(() {
                          selectedImage = photo.path;
                        });
                      } else {}
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColor.primary),
                      ),
                      child: Center(
                          child: Text(
                        '+ Add Images',
                        style: context.text.titleMedium!.copyWith(),
                      )),
                    ),
                  ),
                  CustomButton(
                      verticle: 100,
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            selectedImage != null) {
                          context.read<AddPlantCubit>().addPlantToDatabase(
                              nameController.text,
                              descriptionController.text,
                              typeController.text,
                              priceController.text,
                              //  selectedImage!
                              // commented so as to make the flow easier
                              ' https://res.cloudinary.com/patch-gardens/image/upload/c_fill,h_1000,q_auto:good,w_1000/Group_Baskets_InSitu_CROP_s5lzh5.jpg');
                        } else {
                          NewToastUtils.showErrorToast("All fields required.");
                        }
                      },
                      buttonText: "Add")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedFilesDisplayWidgetHomework extends StatelessWidget {
  const SelectedFilesDisplayWidgetHomework(
      {super.key, required this.filePath, required this.onTap});
  final String filePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: AppColor.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.file(
                    File(filePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
