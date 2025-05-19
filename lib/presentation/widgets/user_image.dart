import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_shimmer.dart';

class UserImage extends StatelessWidget {
  final String userImage;
  final bool editImage;
  final bool load;
  final void Function()? onTap;

  const UserImage({
    super.key,
    this.userImage = '',
    this.editImage = false,
    this.load = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return load
        ? AppShimmer(
          widget: Container(
            height: 220,
            width: 220,
            child: Center(
              child: Container(
                height: 200,
                width: 200,

                decoration: BoxDecoration(
                  color: Colors.indigo[200],
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(child: Icon(Icons.person_outlined, size: 80, color: Colors.white)),
              ),
            ),
          ),
        )
        : Container(
          height: 220,
          width: 220,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child:
                    userImage != ''
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.file(
                            File(userImage),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Container(
                          height: 200,
                          width: 200,

                          decoration: BoxDecoration(
                            color: Colors.indigo[200],
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Center(
                            child: Icon(Icons.person_outlined, size: 80, color: Colors.white),
                          ),
                        ),
              ),

              if (editImage)
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      height: 76,
                      width: 76,
                      decoration: BoxDecoration(
                        color: Colors.indigo[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(Icons.add_a_photo_outlined, size: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
  }
}
