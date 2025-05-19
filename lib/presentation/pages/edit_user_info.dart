import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_tecnica_avila_tek/cubit/activeButton/active_button_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/jobs/jobs_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/jobs/jobs_state.dart';
import 'package:prueba_tecnica_avila_tek/cubit/photo/photo_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/user/user_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/user/user_state.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_appbar.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_button.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_icon_text_button.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_modal_bottom_sheet.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_progress_indicartor.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_select.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/bottom_box.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/input_form.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/user_image.dart';

class EditUserInfo extends StatelessWidget {
  EditUserInfo({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  List jobsData = [];
  bool load = true;
  String photo = '';
  String path = '';
  Map job = {};
  bool loadingButton = false;
  bool enabledButton = false;
  Future getImage(BuildContext context, bool camera) async {
    Navigator.pop(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );
    if (image == null && image?.path == '') return;
    return image?.path ?? '';
  }

  compare(user, active) {
    print(user);
    var currentData = {
      'first_name': firstnameController.text,
      'last_name': lastnameController.text,
      'email': emailController.text,
      'job_title': job,
      'photo': path,
    };
    var originalValues = {
      'first_name': user['first_name'],
      'last_name': user['last_name'],
      'email': user['email'],
      'job_title': user['job_title'],
      'photo': user['photo'] ?? '',
    };
    final hasAnyChanges = currentData.entries.any((e) => e.value != originalValues[e.key]);
    final allEqual = currentData.entries.every((e) => e.value == originalValues[e.key]);
    Future.delayed(Duration(milliseconds: 500), () {
      if (hasAnyChanges) {
        active.updateActiveButton(true);
      } else if (allEqual) {
        active.updateActiveButton(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserCubit>().state;
    final photoState = context.watch<PhotoCubit>().state;
    final activeButtonWatch = context.watch<ActiveButtonCubit>().state;
    final activeButtonRead = context.read<ActiveButtonCubit>();
    photo = photoState.photoPath;

    if (userState is UserLoaded) {
      final user = userState.userData;
      if (firstnameController.text.isEmpty &&
          lastnameController.text.isEmpty &&
          emailController.text.isEmpty &&
          jobController.text.isEmpty) {
        firstnameController.text = user['first_name'];
        lastnameController.text = user['last_name'];
        emailController.text = user['email'];
        jobController.text = user['job_title']?['value'] ?? {};
        job = user['job_title'];
      }
    }

    final jobsCubit = context.watch<JobsCubit>();

    if (jobsCubit.state is JobsLoaded) {
      jobsData = (jobsCubit.state as JobsLoaded).jobsData;

      load = false;
    }

    return Scaffold(
      appBar: AppAppBar(
        title: 'Edit',
        leading: IconButton(
          onPressed: () {
            if (userState is UserLoaded) {
              context.read<PhotoCubit>().updatephoto(userState.userData['photo'] ?? '');
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back_rounded : Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                UserImage(
                  userImage: photo,
                  editImage: true,
                  onTap: () async {
                    appModalBottomSheet(
                      context,
                      'Select an option',
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIconTextButton(
                                icon: Icon(Icons.camera_alt_outlined),
                                title: 'Take a photo',
                                onPressed: () async {
                                  var image = await getImage(context, true);

                                  path = image;

                                  context.read<PhotoCubit>().updatephoto(image);
                                  if (userState is UserLoaded) {
                                    compare(userState.userData, context.read<ActiveButtonCubit>());
                                  }
                                },
                              ),
                              Gap(30),
                              AppIconTextButton(
                                icon: Icon(Icons.folder_outlined),
                                title: 'Choose an image',
                                onPressed: () async {
                                  var image = await getImage(context, false);
                                  path = image;

                                  context.read<PhotoCubit>().updatephoto(image);

                                  if (userState is UserLoaded) {
                                    compare(userState.userData, context.read<ActiveButtonCubit>());
                                  }
                                },
                              ),
                            ],
                          ),
                          Gap(Platform.isAndroid ? 20 : 40),
                        ],
                      ),
                    );
                  },
                ),
                Gap(20),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      InputForm(
                        onChanged: (value) {
                          if (userState is UserLoaded) {
                            compare(userState.userData, context.read<ActiveButtonCubit>());
                          }
                        },
                        controller: firstnameController,
                        title: 'First name',
                        prefixIcon: Icon(Icons.person_outlined),
                        validator: (value) {
                          if (value == '') {
                            return 'The field cannot be empty';
                          }

                          return null;
                        },
                      ),
                      Gap(20),
                      InputForm(
                        onChanged: (value) {
                          if (userState is UserLoaded) {
                            compare(userState.userData, context.read<ActiveButtonCubit>());
                          }
                        },
                        controller: lastnameController,
                        title: 'Last name',
                        prefixIcon: Icon(Icons.person_outlined),
                        validator: (value) {
                          if (value == '') {
                            return 'The field cannot be empty';
                          }

                          return null;
                        },
                      ),
                      Gap(20),
                      InputForm(
                        onChanged: (value) {
                          if (userState is UserLoaded) {
                            compare(userState.userData, context.read<ActiveButtonCubit>());
                          }
                        },
                        controller: emailController,
                        title: 'Email',
                        enable: false,
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.black),

                        validator: (value) {
                          if (value == '') {
                            return 'The field cannot be empty';
                          }

                          return null;
                        },
                      ),
                      Gap(20),
                      AppSelect(
                        controller: jobController,
                        title: 'Job title',
                        sufixIcon:
                            load ? AppProgressIndicator(color: Colors.black, padding: 15) : null,
                        prefixIcon: Icon(Icons.work_outline, color: Colors.black),
                        dataList: jobsData,
                        modalTitle: 'Select the job title',
                        onTap: (value) {
                          jobController.text = value['value'] ?? '';

                          job = value;

                          if (userState is UserLoaded) {
                            compare(userState.userData, context.read<ActiveButtonCubit>());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomSheet: BottomBox(
        widget: AppButton(
          loading: loadingButton,
          enabled: activeButtonWatch.active,
          title: 'Update profile',
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              FocusScope.of(context).unfocus();
              final updateUser = {
                'first_name': firstnameController.text,
                'last_name': lastnameController.text,
                'email': emailController.text,
                'job_title': job,
                'photo': photo,
              };

              if (userState is UserLoaded) {
                loadingButton = true;
                activeButtonRead.updateActiveButton(false);

                await context.read<UserCubit>().updateUserData(updateUser);

                Future.delayed(Duration(milliseconds: 2000), () {
                  loadingButton = false;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        'Data updated successfully',
                        style: TextStyle(letterSpacing: 0),
                      ),
                    ),
                  );
                  Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                });
              }
            }
          },
        ),
      ),
    );
  }
}
