import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/appbar/storefront_mobile_app_bar.dart';

class MobileAboutPage extends StatelessWidget {
  const MobileAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    TextStyle btnTextStyle = Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: const MobileDrawer(),
        // appBar: const StorefrontAppBar(isMobile: true),
        body: SingleChildScrollView(
          child:
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SelectableText("تمور الحواري",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 24)),
                      // const SizedBox(height: 20),
                      SelectableText(
                        "نقدم أجود انواع الحلويات التمور الأعشاب المكسرات العسل",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  // const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          "تواصل معنا",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 20),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 100,
                          endIndent: 100,
                          height: 20,
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
                                    .copyWith(fontSize: 18),
                              ),
                              SelectableText(
                                "info@alhowaridates.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 16),
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
                                    .copyWith(fontSize: 18)),
                            const SizedBox(height: 15),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () => launchUrlString(
                                        "https://www.facebook.com/alhowaridates"),
                                    style: ElevatedButtonTheme.of(context)
                                        .style!
                                        .copyWith(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(12))),
                                    icon:
                                        const Icon(Ionicons.logo_facebook, size: 26),
                                    label: Text("حسابنا في فيسبوك",
                                        style: btnTextStyle)),
                                ElevatedButton.icon(
                                    onPressed: () => launchUrlString(
                                        "https://www.tiktok.com/@alhowari.dates"),
                                    style: ElevatedButtonTheme.of(context)
                                        .style!
                                        .copyWith(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(12))),
                                    icon: const Icon(Ionicons.logo_tiktok, size: 26),
                                    label: Text("حسابنا في تيك توك",
                                        style: btnTextStyle)),
                                ElevatedButton.icon(
                                    onPressed: () => launchUrlString(
                                        "https://www.instagram.com/alhowaridates/"),
                                    style: ElevatedButtonTheme.of(context)
                                        .style!
                                        .copyWith(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(12))),
                                    icon:
                                        const Icon(Ionicons.logo_instagram, size: 26),
                                    label: Text(
                                      "حسابنا في الانستقرام",
                                      style: btnTextStyle,
                                    ))
                              ],
                            ),
                          ],
                        )),
                        ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButtonTheme.of(context).style!.copyWith(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(12))),
                            icon: const Icon(
                              Ionicons.location_outline,
                              size: 26,
                            ),
                            label: Text(
                              "تعال زورنا, الموقع في الخريطة",
                              style: btnTextStyle,
                            )),
                      ],
                    ),
                  )
          ]),
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
