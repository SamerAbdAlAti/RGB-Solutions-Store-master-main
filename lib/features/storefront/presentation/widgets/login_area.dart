import 'package:beamer/beamer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/desktop/desktop_login.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/types/permission_enum.dart';
import '../../domain/entities/user.dart';
import '../pages/login/bloc/auth_bloc.dart';

class LoginArea extends StatefulWidget {
  final bool isMobile;

  const LoginArea({super.key, this.isMobile = false});

  @override
  State<LoginArea> createState() => _LoginAreaState();
}

class _LoginAreaState extends State<LoginArea> {
  bool showStaffMenu = false;
  bool showDashboard = false;
  bool showDelivery = false;
  bool showBanner = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AuthBloc>().localAccount(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _loginBtn(context);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final User user = snapshot.data!;
              user.isStaff ? showStaffMenu = true : showStaffMenu = false;
              user.userPermission.contains(PermissionEnum.MANAGE_SHIPPING)
                  ? showDelivery = true
                  : showDelivery = false;
              user.userPermission.contains(PermissionEnum.MANAGE_ORDERS)
                  ? showDashboard = true
                  : showDashboard = false;
              user.userPermission.contains(PermissionEnum.MANAGE_PAGES) &&
                      !widget.isMobile
                  ? showBanner = true
                  : showBanner = false;
              return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Column(
                    children: [
                      // const SizedBox(width: 10),
                      Text(
                        "أهلا, ${user.firstName} ${user.lastName}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      MaterialButton(
                        onPressed: () async{
                            await context.read<AuthBloc>().logout(user: user);
                            Beamer.of(context).beamToNamed('/login');
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DesktopLoginPage()));
                            // FirebaseAuth.instance.signOut().then((value) {
                            //   Navigator.of(context).pushReplacementNamed('/login');
                            // }).catchError((e) {
                            //   print(e);
                            // });
                            },
                        child: Row(
                          children: [
                            Icon(Icons.logout_outlined, size: 26, color: Colors.red),
                            SizedBox(width: 5.0),
                            Text("تسجيل الخروج", style: TextStyle(fontSize: 16.0, color: Colors.red),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  !showStaffMenu
                      ? SizedBox.fromSize()
                      : SizedBox(
                          width: widget.isMobile ? 150 : null,
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            customButton: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: StoreTheme.breakerColor,
                                      width: 2)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.menu_outlined, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      "الاعدادات",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: StoreTheme.commonColor),
                                    ),
                                  ]),
                            ),
                            onChanged: (value) {
                              if (value == 1) {
                                launchUrlString(
                                    "https://alhowaridates.eu.saleor.cloud/dashboard/");
                              }
                              if (value == 2) {
                                Beamer.of(context)
                                    .beamToReplacementNamed('/delivery');
                              }
                              if (value == 3) {
                                Beamer.of(context)
                                    .beamToReplacementNamed('/banner');
                              }
                            },
                            items: [
                              if (showDashboard)
                                const DropdownMenuItem(
                                    value: 1, child: Text("لوحة التحكم")),
                              if (showDelivery)
                                const DropdownMenuItem(
                                    value: 2, child: Text("توصيل")),
                              if (showBanner)
                                const DropdownMenuItem(
                                    value: 3, child: Text("البنرات")),
                            ],
                          )),
                        )
                ],
              );
            } else {
              return _loginBtn(context);
            }
          default:
            return _loginBtn(context);
        }
      },
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Beamer.of(context).beamToNamed('/login');
      },
      child: const Text("تسجيل الدخول"),
    );
  }
}
