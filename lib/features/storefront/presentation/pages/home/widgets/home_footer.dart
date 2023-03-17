import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeFooter extends StatefulWidget implements Footer {
  const HomeFooter({super.key});

  @override
  State<HomeFooter> createState() => _HomeFooterState();

  @override
  Alignment? get alignment => throw UnimplementedError();

  @override
  Color? get backgroundColor => throw UnimplementedError();

  @override
  Widget get child => throw UnimplementedError();

  @override
  EdgeInsetsGeometry? get padding => throw UnimplementedError();
}

class _HomeFooterState extends State<HomeFooter> {
  @override
  Widget build(BuildContext context) {
    return Footer(
        backgroundColor: Theme.of(context).textTheme.headlineMedium!.color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _footerTextButton(context, const Text("الرئيسية"),
                    () => Beamer.of(context).beamToReplacementNamed('/')),
                _footerTextButton(context, const Text("المتجر"),
                    () => Beamer.of(context).beamToReplacementNamed('/store')),
                _footerTextButton(
                  context,
                  const Text("تواصل معنا"),
                  () => Beamer.of(context).beamToReplacementNamed('/about'),
                )
              ],
            ),
            const Divider(
              thickness: 2,
              height: 50,
              endIndent: 100,
              indent: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  "تابعنا من خلال مواقع التواصل الإجتماعي",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey.shade300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => launchUrlString(
                          'https://www.facebook.com/alhowaridates'),
                      icon: Icon(
                        Ionicons.logo_facebook,
                        color: Colors.grey.shade300,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () => launchUrlString(
                          'https://www.tiktok.com/@alhowari.dates'),
                      icon: Icon(
                        Ionicons.logo_tiktok,
                        color: Colors.grey.shade300,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () => launchUrlString(
                          "https://www.instagram.com/alhowaridates/"),
                      icon: Icon(
                        Ionicons.logo_instagram,
                        color: Colors.grey.shade300,
                        size: 32,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 2,
              indent: 500,
              endIndent: 500,
              height: 30,
            ),
            SelectableText(
              "Powered by RGB Solutions",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ));
  }

  Widget _footerTextButton(
      BuildContext context, Widget child, void Function() onPressed) {
    return TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
            foregroundColor: MaterialStateProperty.all(Colors.grey.shade300)),
        child: child);
  }
}
