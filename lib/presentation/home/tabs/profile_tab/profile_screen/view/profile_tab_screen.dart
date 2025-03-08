import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/data/model/profile_tab/image_provider_model.dart';
import 'package:online_exam/data/model/profile_tab/user_profile.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/profile_response_entity.dart';
import 'dart:io';
import 'package:online_exam/presentation/home/tabs/profile_tab/change_password/view/new_password.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/edit_profile_screen/view/edit_profile_tab_screen.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/profile_screen/view_model/profile_screen_view_model_cubit.dart';
import 'package:provider/provider.dart';

class ProfileTabScreen extends StatefulWidget {
  final String userId;

  ProfileTabScreen({required this.userId});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  late TextEditingController usernameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  late UserProfile userProfile;

  bool isLoading = true;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    _fetchProfileData();
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _navigateToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileTabScreen(userId: widget.userId),
      ),
    );

    if (result == true) {
      _fetchProfileData();
    }
  }

  void _fetchProfileData() async {
    var response = await getIt<ProfileScreenViewModelCubit>()
        .getProfileInfoUsecase
        .call(id: widget.userId);
    if (response is SuccessApiResult<ProfileResponseEntity> &&
        response.data!.user != null) {
      setState(() {
        userProfile = UserProfile.fromEntity(response.data!.user!);
        usernameController =
            TextEditingController(text: userProfile.username ?? "");
        firstNameController =
            TextEditingController(text: userProfile.firstName ?? "");
        lastNameController =
            TextEditingController(text: userProfile.lastName ?? "");
        emailController = TextEditingController(text: userProfile.email ?? "");
        phoneController = TextEditingController(text: userProfile.phone ?? "");
        passwordController = TextEditingController(text: "********");
      });
    } else {
      print("Error fetching profile data");
    }
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Consumer<ImageProviderModel>(
        builder: (context, imageProvider, child) => Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: [
              const Text(
                "Choose an option",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.camera, size: 30),
                title:
                    const Text("Take a photo", style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  imageProvider.pickImage(ImageSource.camera);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.photo_library, size: 30),
                title: const Text("Choose from gallery",
                    style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  imageProvider.pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<ProfileScreenViewModelCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<ImageProviderModel>(
                    builder: (context, imageProvider, child) => Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: imageProvider.selectedImage != null
                              ? FileImage(imageProvider.selectedImage!)
                              : null,
                          child: imageProvider.selectedImage == null
                              ? const Icon(Icons.person,
                                  size: 50, color: ColorManager.labelLarge)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _showImagePicker(context),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorManager.primaryColor,
                              child: Icon(Icons.camera_alt,
                                  size: 22,
                                  color: ColorManager.backgroundBottomNavBar),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomTextField(
                    labelText: "User name",
                    controller: usernameController,
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "First name",
                          controller: firstNameController,
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Last name",
                          controller: lastNameController,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: "Email",
                    controller: emailController,
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomTextField(
                        labelText: "Password",
                        controller: passwordController,
                        obscuringCharacter: "*",
                        obscureText: true,
                      ),
                      Positioned(
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(
                                    passwordController.text),
                              ),
                            );
                          },
                          child: const Text(
                            "Change",
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.bold,
                                decorationThickness: 2.0),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: "Phone number",
                    controller: phoneController,
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  CustomTextButton(
                    text: StringManager.update,
                    onPressed: _navigateToEditProfile,
                    color: ColorManager.primaryColor,
                    textColor: ColorManager.backgroundBottomNavBar,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
