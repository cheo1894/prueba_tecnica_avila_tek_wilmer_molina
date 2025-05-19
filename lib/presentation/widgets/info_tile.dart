import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_shimmer.dart';

class InfoTile extends StatelessWidget {
  final String title;

  final String info;
  final bool load;

  const InfoTile({super.key, this.title = '', this.info = '', this.load = false});

  @override
  Widget build(BuildContext context) {
    return load
        ? AppShimmer(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width / 3,
                height: 18,
              ),
              Gap(10),
              Container(color: Colors.black, width: double.infinity, height: 16),
              Gap(16),
            ],
          ),
        )
        : ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0),
          ),
          subtitle: Text(
            info,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0),
          ),
        );
  }
}
