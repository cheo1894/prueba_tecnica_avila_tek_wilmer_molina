import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:prueba_tecnica_avila_tek/cubit/user/user_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/user/user_state.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_appbar.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_button.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/bottom_box.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/info_tile.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/user_image.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Map userData = {};
    bool load = true;
    final userCubit = context.watch<UserCubit>();

    if (userCubit.state is UserLoaded) {
      userData = (userCubit.state as UserLoaded).userData;
      load = false;
    }
    if (userCubit.state is UserError) {
      var error = (userCubit.state as UserError).message;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Text(error, style: TextStyle(letterSpacing: 0)),
          ),
        );
      });
    }
    return Scaffold(
      appBar: AppAppBar(title: 'User information'),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserImage(userImage: userData['photo'] ?? '', load: load),
              Gap(20),

              InfoTile(info: userData['first_name'] ?? '', title: 'First name', load: load),

              Divider(),

              InfoTile(info: userData['last_name'] ?? '', title: 'Last name', load: load),

              Divider(),

              InfoTile(info: userData['email'] ?? '', title: 'Email', load: load),

              Divider(),

              InfoTile(info: userData['job_title']?['value'] ?? '', title: 'Job title', load: load),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBox(
        widget: AppButton(
          enabled: !load,
          title: 'Edit',
          onPressed: () {
            Navigator.pushNamed(context, '/edit', arguments: userData);
          },
        ),
      ),
    );
  }
}
