import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/footer_wrapper.dart';

class DesktopAboutPage extends StatelessWidget {
  const DesktopAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const StorefrontAppBar(),
        body: FooterWrapper(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: screenSize.width * 0.75,
                child: Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      SelectableText("تمور الحواري",
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 50),
                      SelectableText(
                        "نقدم أجود انواع الحلويات التمور الأعشاب المكسرات العسل",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge,
                      )
                    ],
                  )),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          "تواصل معنا",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 30),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 100,
                          endIndent: 100,
                          height: 50,
                        ),
                        _infoCard(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText(
                                "البريد الإلكتروني: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 24),
                              ),
                              Flexible(
                                child: SelectableText(
                                  "info@alhowaridates.com",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _infoCard(
                            child: Column(
                          children: [
                            Text("تواصل معنا عبر مواقع التواصل الإجتماعي",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 24)),
                            const Divider(
                              height: 30,
                              thickness: 1,
                              indent: 200,
                              endIndent: 200,
                            ),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () => launchUrlString(
                                        "https://www.facebook.com/alhowaridates"),
                                    icon: const Icon(Ionicons.logo_facebook,
                                        size: 32),
                                    label: const Text("صفحتنا في فيسبوك")),
                                ElevatedButton.icon(
                                    onPressed: () => launchUrlString(
                                        "https://www.tiktok.com/@alhowari.dates"),
                                    icon: const Icon(Ionicons.logo_tiktok,
                                        size: 32),
                                    label: const Text("حسابنا في تيك توك")),
                                ElevatedButton.icon(
                                    onPressed: () => launchUrlString(
                                        "https://www.instagram.com/alhowaridates/"),
                                    icon: const Icon(Ionicons.logo_instagram,
                                        size: 32),
                                    label: const Text("حسابنا في الانستقرام"))
                              ],
                            ),
                          ],
                        )),
                        ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 20),
                                elevation: 5),
                            icon: const Icon(
                              Ionicons.location_outline,
                              size: 32,
                            ),
                            label: const Text("تعال زورنا, الموقع في الخريطة")),
                      ],
                    ),
                  ))
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoCard(
      {required Widget child,
      EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 20, top: 20)}) {
    return Card(
        elevation: 5,
        margin: margin,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ));
  }
}
