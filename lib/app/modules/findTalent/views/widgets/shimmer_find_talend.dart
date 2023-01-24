import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFindTalend extends StatelessWidget {
  const ShimmerFindTalend({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                ),
                title: UnconstrainedBox(
                  child: Container(
                    height: size.height * 0.018,
                    width: size.width * 0.46,
                    color: Colors.grey,
                  ),
                ),
                subtitle: UnconstrainedBox(
                  child: Container(
                    height: size.height * 0.01,
                    width: size.width * 0.4,
                    color: Colors.grey,
                  ),
                ),
                trailing: const CircleAvatar(
                  radius: 20,
                ),
              ),
            ],
          );
          ;
        },
        separatorBuilder: (_, __) => sizedheight(size.height * 0.02),
        itemCount: 10,
      ),
    );
  }
}
