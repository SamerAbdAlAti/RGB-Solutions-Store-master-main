import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';

import '../../bloc/storefront_bloc.dart';
import '../../widgets/appbar/storefront_mobile_app_bar.dart';
import '../../widgets/category_grid_widget/category_grid_widget.dart';
import '../../widgets/container_error_widget.dart';
import '../../widgets/product_view.dart';

class MobileStorePage extends StatelessWidget {
  const MobileStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<StorefrontBloc, StorefrontState>(
        builder: (context, state) {
          return Scaffold(
            // appBar: const StorefrontAppBar(isMobile: true),
            drawer: const MobileDrawer(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: CategoryGridWidget(
                        itemsInRow: 2,
                        buttonTextStyle: ButtonTextStyle(
                            textStyle: Theme.of(context).textTheme.titleSmall ??
                                const TextStyle()),
                        width: double.infinity,
                        itemBuilder: (context, item, index) =>
                            ProductView(product: item, isMobile: true),
                        fetch: context.read<StorefrontBloc>().getCategories(
                            amount: 12,
                            channel: 'default-channel',
                            amountOfProducts: 20),
                        fetchMore: (id, channel, amountOfProducts, after) =>
                            context.read<StorefrontBloc>().getSingleCategory(
                                id: id,
                                channel: channel,
                                amountOfProducts: amountOfProducts),
                        onEmpty: const Text("لا توجد بيانات"),
                        itemHeight: 220,
                        margin: const EdgeInsets.all(20),
                        onError: const ContainerErrorWidget(
                            message: Text("خطأ في السيرفر")),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
