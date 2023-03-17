import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/utl/phone_converter.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/widgets/order_details_util.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';

import '../../../widgets/footer_wrapper.dart';
import '../widgets/empty_orders.dart';
import '../widgets/order_tiles.dart';

class DesktopAccountPage extends StatelessWidget {
  DesktopAccountPage({super.key});

  final util = OrderDetailsUtil();

  @override
  Widget build(BuildContext context) {
    User? user = Beamer.of(context).currentBeamLocation.data as User?;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const StorefrontAppBar(),
        body: FooterWrapper(
          child: user != null
              ? _fullWidget(context, user)
              : FutureBuilder(
                  future: context.read<AuthBloc>().onlineAccount(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _fullWidget(context, snapshot.data!);
                    }
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData == false) {
                      return _premoteAccountRegister(context);
                    }
                    return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2));
                  }),
        ),
      ),
    );
  }

  Widget _fullWidget(BuildContext context, User user) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: SizedBox(
          width: screenSize.width * 0.75,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      height: 400,
                      child: Column(children: [
                        Text(
                          "بيانات حسابي",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Divider(
                          height: 20,
                          color: StoreTheme.commonColor,
                        ),
                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black87, fontSize: 16.0),
                                      decoration: CustomInputDecorations
                                          .desktopInputDecoration("الاسم الأول",
                                              Ionicons.person_outline),
                                      initialValue: user.firstName,
                                      readOnly: true,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black87, fontSize: 16.0),
                                      initialValue: user.lastName,
                                      readOnly: true,
                                      decoration: CustomInputDecorations
                                          .desktopInputDecoration(
                                              "الاسم الأخير",
                                              Ionicons.person_outline),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.black87, fontSize: 16.0),
                                readOnly: true,
                                initialValue:
                                    PhoneConverter().toPhone(user.email),
                                decoration: CustomInputDecorations
                                    .desktopInputDecoration(
                                        "رقم الهاتف", Ionicons.call_outline),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  flex: 5,
                  child: Column(
                   children: [
                    Row(
                      children: [
                        Text(
                          "طلباتي",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 30),
                    for (Order order in user.orders) OrderTiles(order: order),
                    user.orders.isEmpty
                        ? const EmptyOrders()
                        : const SizedBox.shrink()
                  ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _premoteAccountRegister(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Beamer.of(context).beamToReplacementNamed('/register');
    });

    return Container();
  }
}
