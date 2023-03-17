import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_mobile_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/dialog_manager.dart';

import '../../../widgets/appbar/storefront_app_bar.dart';
import '../../../widgets/footer_wrapper.dart';
import '../widgets/cart_invoice.dart';
import '../widgets/cart_mobile_product_tile.dart';
import '../widgets/cart_not_logged_in.dart';
import '../widgets/empty_cart.dart';

class CartMobilePage extends StatefulWidget {
  const CartMobilePage({super.key});

  @override
  State<CartMobilePage> createState() => _CartMobilePageState();
}

class _CartMobilePageState extends State<CartMobilePage> {
  late User user;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const StorefrontAppBar(isMobile: true),
        drawer: const MobileDrawer(),
        body: FooterWrapper(
          child: FutureBuilder(
              future: context.read<AuthBloc>().localAccount(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const CartNotLoggedIn();

                if (snapshot.connectionState == ConnectionState.done) {
                  return BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.map(
                        readyOrder: (value) => const EmptyCartWidget(),
                        initial: (value) {
                          if (snapshot.data != null &&
                              snapshot.data!.checkouts.isNotEmpty) {
                            user = snapshot.data!;
                            return _fullWidget(
                                context,
                                value.checkout ??
                                    snapshot.data!.checkouts.first);
                          } else {
                            return const EmptyCartWidget();
                          }
                        },
                        loading: (value) => SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: LoadingOverlay(
                              isLoading: true,
                              opacity: 0.4,
                              color: Colors.black38,
                              child: _fullWidget(
                                  context, snapshot.data!.checkouts.first)),
                        ),
                        ready: (value) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            DialogManager.successDialog(
                                context: context,
                                message: value.message,
                                title: value.title);
                          });
                          if (snapshot.data != null &&
                              snapshot.data!.checkouts.isNotEmpty) {
                            user = snapshot.data!;
                            return _fullWidget(context, value.checkout);
                          } else {
                            return const EmptyCartWidget();
                          }
                        },
                        error: (value) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            DialogManager.errorDialog(
                                context: context,
                                description: value.message,
                                title: value.title);
                          });
                          if (snapshot.data != null &&
                              snapshot.data!.checkouts.isNotEmpty) {
                            user = snapshot.data!;
                            return _fullWidget(context, value.checkout);
                          } else {
                            return const EmptyCartWidget();
                          }
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }
              }),
        ),
      ),
    );
  }

  Widget _fullWidget(BuildContext context, Checkout checkout) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Text(
              "سلة التسوق",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 32),
            ),
            Divider(
              color: StoreTheme.unselectedColor,
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text(
                      "الطلبات",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 30),
                    checkout.lines.isEmpty
                        ? const EmptyCartWidget()
                        : const SizedBox.shrink(),
                    for (CheckoutLine line in checkout.lines)
                      MobileCartProductTile(
                          line: line, checkoutId: checkout.id),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: CartInvoice(
                      checkout: checkout,
                      user: user,
                      isMobile: true,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
