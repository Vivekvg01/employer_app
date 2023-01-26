import 'package:employer_app/app/modules/recharge/views/widgets/pack_tile.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';

class BuyConnects extends StatelessWidget {
  const BuyConnects({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        PackTileWidget(),
        sizedheight(10),
        PackTileWidget(),
      ],
    );
  }
}
