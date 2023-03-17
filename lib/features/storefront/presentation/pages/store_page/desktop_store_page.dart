import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/storefront_bloc.dart';
import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/category_grid_widget/category_grid_widget.dart';
import '../../widgets/container_error_widget.dart';
import '../../widgets/footer_wrapper.dart';
import '../../widgets/product_view.dart';

class DesktopStorePage extends StatelessWidget {
  const DesktopStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    double thirdOfScreen = MediaQuery.of(context).size.width / 8;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const StorefrontAppBar(),
          body: FooterWrapper(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: 100, left: thirdOfScreen, right: thirdOfScreen),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: CategoryGridWidget(
                        width: double.infinity,
                        itemBuilder: (context, item, index) =>
                            ProductView(product: item, isMobile: false),
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
                        margin: const EdgeInsets.only(top: 40),
                        onError: const ContainerErrorWidget(
                            message: Text("خطأ في السيرفر")),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
