import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';

import '../../domain/entities/product.dart';

class AddToCartButton extends StatefulWidget {
  final Product product;
  int Function() intCallback;
  void Function(String message) onError;
  String? variantId;
  AddToCartButton(
      {super.key,
      required this.product,
      required this.intCallback,
      required this.onError,
      this.variantId});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  late RoundedLoadingButtonController buttonController;

  @override
  void initState() {
    super.initState();
    buttonController = RoundedLoadingButtonController();
  }

  @override
  Widget build(BuildContext context) {
    int lateist = widget.intCallback();
    return FutureBuilder(
        future: context.read<AuthBloc>().localAccount(),
        builder: (context, snapshot) {
          return snapshot.hasError || !snapshot.hasData
              ? SizedBox(
                  width: 150,
                  child: RoundedLoadingButton(
                      controller: buttonController,
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/register');
                      },
                      child: Text(
                        "إنشاء حساب",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                      )),
                )
              : BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.map(
                        initial: (value) => _buildWidget(context, lateist),
                        loading: (value) {
                          SchedulerBinding.instance
                              .addPostFrameCallback((_) async {
                            buttonController.start();
                          });
                          return _buildWidget(context, lateist);
                        },
                        ready: (value) {
                          SchedulerBinding.instance
                              .addPostFrameCallback((_) async {
                            buttonController.success();
                            await Future.delayed(const Duration(seconds: 2));
                            buttonController.stop();
                          });
                          return _buildWidget(context, lateist);
                        },
                        error: (value) {
                          SchedulerBinding.instance
                              .addPostFrameCallback((_) async {
                            buttonController.error();
                            widget.onError(value.message);
                            await Future.delayed(const Duration(seconds: 2));
                            buttonController.reset();
                          });
                          return _buildWidget(context, lateist);
                        },
                        readyOrder: (value) => _buildWidget(context, lateist));
                  },
                );
        });
  }

  Widget _buildWidget(BuildContext context, int quantity) {
    return RoundedLoadingButton(
        controller: buttonController,
        errorColor: Theme.of(context).colorScheme.error,
        successColor: StoreTheme.breakerColor,
        color: StoreTheme.tentColor,
        width: 150,
        onPressed: () {
          context.read<CartBloc>().add(CartEvent.addItem(
              context.read<AuthBloc>().localAccount(),
              widget.variantId ?? widget.product.defaultVariant.id,
              quantity));
        },
        child: Text(
          "اضف الى السلة",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
        ));
  }
}

// class AddCartIcon extends StatefulWidget {
//   AddCartIcon({super.key, required this.product, required this.intCallback});
//   final Product product;
//   int Function() intCallback;

//   @override
//   State<AddCartIcon> createState() => _AddCartIconState();
// }

// class _AddCartIconState extends State<AddCartIcon> {
//   late RoundedLoadingButtonController buttonController;

//   @override
//   void initState() {
//     buttonController = RoundedLoadingButtonController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     int lateist = widget.intCallback();
//     return FutureBuilder(
//         future: context.read<AuthBloc>().localAccount(),
//         builder: (context, snapshot) {
//           return snapshot.hasError
//               ? IconButton(
//                   onPressed: () {
//                     Beamer.of(context).beamToNamed('/register');
//                   },
//                   icon: const Icon(Ionicons.bag_add_outline))
//               : BlocBuilder<CartBloc, CartState>(
//                   builder: (context, state) {
//                     return state.map(
//                       initial: (value) {
//                         return IconButton(
//                             onPressed: widget.product.isAvailable
//                                 ? () {
//                                     setState(() {
//                                       lateist = widget.intCallback();
//                                     });
//                                     context.read<CartBloc>().add(
//                                         CartEvent.addItem(
//                                             context
//                                                 .read<AuthBloc>()
//                                                 .localAccount(),
//                                             widget.variantId?? widget.product.defaultVariant.id,
//                                             lateist));
//                                   }
//                                 : null,
//                             icon: const Icon(Ionicons.bag_add_outline));
//                       },
//                       readyOrder: (value) => RoundedLoadingButton(
//                           onPressed: widget.product.isAvailable
//                               ? () {
//                                   setState(() {
//                                     lateist = widget.intCallback();
//                                   });
//                                   context.read<CartBloc>().add(
//                                       CartEvent.addItem(
//                                           context
//                                               .read<AuthBloc>()
//                                               .localAccount(),
//                                           widget.variantId?? widget.product.defaultVariant.id,
//                                           lateist));
//                                 }
//                               : null,
//                           controller: buttonController,
//                           child: const Icon(Ionicons.bag_add_outline)),
//                       loading: (value) {
//                         SchedulerBinding.instance.addPostFrameCallback((_) {
//                           buttonController.start();
//                         });
//                         return const CircularProgressIndicator(strokeWidth: 2);
//                       },
//                       ready: (value) {
//                         SchedulerBinding.instance.addPostFrameCallback((_) {
//                           buttonController.success();
//                         });
//                         return IconButton(
//                             onPressed: widget.product.isAvailable
//                                 ? () {
//                                     context.read<CartBloc>().add(
//                                         CartEvent.addItem(
//                                             context
//                                                 .read<AuthBloc>()
//                                                 .localAccount(),
//                                             widget.variantId?? widget.product.defaultVariant.id,
//                                             lateist));
//                                   }
//                                 : null,
//                             icon: const Icon(Ionicons.bag_add_outline));
//                       },
//                       error: (value) => const CircularProgressIndicator(),
//                     );
//                   },
//                 );
//         });
//   }
// }
