import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core/theme/app_theme.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: Center(
          child: SizedBox(
              width: screenSize.width * 0.75,
              child: Column(
                children: [
                  const Text("اضف الى السلة"),
                  Icon(
                    Ionicons.cart,
                    size: 200,
                    color: StoreTheme.unselectedColor,
                  ),
                ],
              ))),
    );
  }
}
