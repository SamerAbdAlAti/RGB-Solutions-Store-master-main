import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../widgets/container_error_widget.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_input_decorations.dart';
import '../widgets/custom_phone_input.dart';
import '../widgets/password_validator_strings.dart';

class DesktopRegisterPage extends StatefulWidget {
  const DesktopRegisterPage({Key? key}) : super(key: key);

  @override
  State<DesktopRegisterPage> createState() => _DesktopRegisterPageState();
}

class _DesktopRegisterPageState extends State<DesktopRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

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
            loaded: (_) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Beamer.of(context).beamToNamed('/');
              });
              return _screen(context);
            },
            error: (error) => _screen(context, error: error));
      },
    );
  }

  void _showOtpDialog(String phone) {
    showDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return FirebasePhoneAuthProvider(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: FirebasePhoneAuthHandler(
              sendOtpOnInitialize: true,
              phoneNumber: phone,
              signOutOnSuccessfulVerification: false,
              linkWithExistingUser: false,
              autoRetrievalTimeOutDuration: const Duration(seconds: 60),
              otpExpirationDuration: const Duration(seconds: 60),
              onCodeSent: () {},
              onLoginSuccess: (userCredential, autoVerified) async {
                context.read<AuthBloc>().add(AuthEvent.register(
                    phoneNumber: phone,
                    password: passwordController.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text));
              },
              onLoginFailed: (authException, stackTrace) {
                switch (authException.code) {
                  case 'invalid-phone-number':
                    // invalid phone number
                    return debugPrint('Invalid phone number!');
                  case 'invalid-verification-code':
                    // invalid otp entered
                    return debugPrint('The entered OTP is invalid!');
                  // handle other error codes
                  default:
                    debugPrint('Something went wrong!');
                  // handle error further if needed
                }
              },
              onError: (error, stackTrace) {
                debugPrint(error.toString());

                debugPrint('An error occurred!');
              },
              builder: (context, controller) {
                return Center(
                  child: Container(
                    height: 240,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("تحقق من الهاتف",
                            style: Theme.of(context).textTheme.displaySmall),
                        Text(phone,
                            style: Theme.of(context).textTheme.headlineSmall),
                        VerificationCode(
                          length: 6,
                          onCompleted: (enteredOtp) async {
                            final verified =
                                await controller.verifyOtp(enteredOtp);
                            if (verified) {
                            } else {
                              // phone verification failed
                              // will call onLoginFailed or onError callbacks with the error
                            }
                          },
                          onEditing: (bool value) {},
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            controller.isSendingCode
                                ? const CircularProgressIndicator(
                                    strokeWidth: 2)
                                : TextButton(
                                    onPressed: controller.isOtpExpired
                                        ? () async {
                                            await controller.sendOTP();
                                          }
                                        : null,
                                    child: Text(
                                      controller.isOtpExpired
                                          ? 'أعد الإرسال'
                                          : '${controller.otpExpirationTimeLeft.inSeconds}s',
                                      style: TextStyle(
                                          color: StoreTheme.tentColor,
                                          fontSize: 18),
                                    ),
                                  ),
                            const SizedBox(width: 100),
                            TextButton(
                                onPressed: () {
                                  Beamer.of(context).popRoute();
                                },
                                child: const Text("إغلاق"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _screen(BuildContext context, {String? error}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                cursorHeight: 30.0,
                                style: TextStyle(color: Colors.black87, fontSize: 20.0),
                                maxLines: 1,
                                controller: firstNameController,
                                decoration: CustomInputDecorations
                                    .desktopInputDecoration(
                                    "الاسم الأول", Ionicons.person_outline),
                              ),
                            ),
                            /*
                                (
                                  // contentPadding: padding,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: StoreTheme.tentColor)),
                                  focusColor: StoreTheme.tentColor,
                                  hintText: "الاسم الأول",
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  filled: true,
                                  isDense: true,
                                  prefixIcon: Icon(
                                    Ionicons.person_outline,
                                    size: 18,
                                    color: StoreTheme.commonColor,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: StoreTheme.tentColor)),
                                )
                                TextFormField(
                                maxLines: 1,
                                controller: firstNameController,
                                decoration: CustomInputDecorations
                                    .desktopInputDecoration(
                                        "الاسم الأول", Ionicons.person_outline),
                              ),
                                 */
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                cursorHeight: 30.0,
                                style: TextStyle(color: Colors.black87, fontSize: 20.0),
                                maxLines: 1,
                                controller: lastNameController,
                                decoration: CustomInputDecorations
                                    .desktopInputDecoration("الاسم الأخير",
                                        Ionicons.person_outline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 420,
                            child: CustomPhoneInput(
                              controller: phoneController,
                              formKey: _formKey,
                              onChanged: (p0) {
                                phoneNumber = p0;
                              },
                            )),
                        SizedBox(
                          width: 420,
                          child: TextFormField(
                              cursorHeight: 30.0,
                              style: TextStyle(color: Colors.black87, fontSize: 20.0),
                              maxLines: 1,
                              obscureText: true,
                              controller: passwordController,
                              decoration:
                                  CustomInputDecorations.desktopInputDecoration(
                                      "أدخل كلمة السر", Ionicons.key_outline)),
                        ),
                        FlutterPwValidator(
                            controller: passwordController,
                            strings: ArabicString(),
                            minLength: 8,
                            width: 400,
                            height: 40,
                            successColor: const Color(0xff497039),
                            onSuccess: () {},
                            onFail: () {}),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 420,
                          child: TextFormField(
                              cursorHeight: 30.0,
                              style: TextStyle(color: Colors.black87, fontSize: 20.0),
                              maxLines: 1,
                              controller: rePasswordController,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value != passwordController.text) {
                                  return "كلمة المرور ليست متشابها";
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              decoration:
                                  CustomInputDecorations.desktopInputDecoration(
                                      "أعد إدخال كلمة السر",
                                      Ionicons.key_outline)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String? val = await context
                                  .read<AuthBloc>()
                                  .ifUserExist(
                                      phoneNumber: phoneNumber.completeNumber,
                                      password: passwordController.text);
                              if (val == null) {
                                _showOtpDialog(phoneNumber.completeNumber);
                              } else {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  onVisible: () async {
                                    await Future.delayed(
                                        const Duration(seconds: 1));
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentMaterialBanner();
                                    }
                                  },
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'الحساب موجود',
                                    message:
                                        'يوجد حساب مسجل بهذا الرقم يرجى تسجيل الدخول.',
                                    contentType: ContentType.warning,
                                  ),
                                );
                                if (mounted) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          ),
                          child: const Text(
                            'أنشئ حساب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('تملك حساب؟',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18)),
                            TextButton(
                              onPressed: () {
                                Beamer.of(context).beamToNamed('/login');
                              },
                              child: const Text('قم بتسجيل الدخول'),
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
