// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:beamer/beamer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_phone_input.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/container_error_widget.dart';

import '../../../widgets/footer_wrapper.dart';

class DesktopLoginPage extends StatefulWidget {
  const DesktopLoginPage({Key? key}) : super(key: key);

  @override
  State<DesktopLoginPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopLoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool useEmail = false;
  PhoneNumber phoneNumber =
      PhoneNumber(countryISOCode: 'JO', countryCode: '+962', number: '');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          empty: () {
            return _screen(context);
          },
          loading: () {
            return _screen(context);
          },
          loaded: (user) {
            SchedulerBinding.instance.addPostFrameCallback(
              (_) {
                showDialog(
                  context: context,
                  builder: (context) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      Beamer.of(context).beamToNamed('/');
                    });
                    return Container(
                      width: 200,
                      height: 200,
                      color: StoreTheme.unselectedColor,
                      child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                );
              },
            );
            return _screen(context);
          },
          error: (message) {
            return _screen(context, error: message);
          },
        );
      },
    );
  }

  Widget _screen(BuildContext context, {String? error}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FooterWrapper(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Beamer.of(context).beamToNamed('/'),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/image/login.png'),
                      ),
                    ),
                  ),
                  error != null
                      ? ContainerErrorWidget(
                          width: 400,
                          message: Text(
                            error,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onError),
                          ))
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 60,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            width: 350,
                            child: useEmail
                                ? TextFormField(
                                    cursorHeight: 20.0,
                                    style: TextStyle(color: Colors.black87, fontSize: 16.0),
                                    controller: emailController,
                                    decoration: CustomInputDecorations
                                        .desktopInputDecoration(
                                            "ادخل البريد الاكتروني",
                                            Ionicons.mail_outline),
                                    autofillHints: const [
                                      AutofillHints.email,
                                      AutofillHints.username
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'ادخل بريد اكتروني';
                                      }
                                      return EmailValidator.validate(value)
                                          ? null
                                          : 'البردي الاكتروني غير صالح';
                                    },
                                  )
                                : CustomPhoneInput(
                                    controller: phoneController,
                                    formKey: _formKey,
                                    onChanged: (p0) {
                                      phoneNumber = p0;
                                    },
                                  )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                              cursorHeight: 20.0,
                              style: TextStyle(color: Colors.black87, fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال كلمة السر';
                                }
                                return null;
                              },
                              maxLines: 1,
                              controller: passwordController,
                              autofillHints: const [AutofillHints.password],
                              obscureText: true,
                              decoration:
                                  CustomInputDecorations.desktopInputDecoration(
                                      "أدخل كلمة السر", Ionicons.key_outline)),
                        ),
                        SizedBox(
                          width: 350,
                          child: CheckboxListTile(
                            title: Text("البقاء متصلًا",
                                style: Theme.of(context).textTheme.titleMedium),
                            contentPadding: EdgeInsets.zero,
                            value: rememberValue,
                            activeColor: Theme.of(context).colorScheme.primary,
                            onChanged: (newValue) {
                              setState(() {
                                rememberValue = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              useEmail
                                  ? context.read<AuthBloc>().add(
                                      AuthEvent.loginWithEmail(
                                          email: emailController.text,
                                          password: passwordController.text))
                                  : context.read<AuthBloc>().add(
                                      AuthEvent.login(
                                          phoneNumber:
                                              phoneNumber.completeNumber,
                                          password: passwordController.text));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          ),
                          child: const Text(
                            'تسجيل دخول',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('لا تملك حسابًا؟',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18)),
                            TextButton(
                              onPressed: () {
                                Beamer.of(context).beamToNamed('/register');
                              },
                              child: const Text('قم بإنشاء حساب'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('سجل بإستخدام',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 14)),
                            TextButton(
                              onPressed: () {
                                useEmail ? useEmail = false : useEmail = true;
                                setState(() {});
                              },
                              child: Text(
                                useEmail ? 'رقم الهاتف' : 'البريد الإلكتروني',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
