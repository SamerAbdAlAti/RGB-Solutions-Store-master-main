import 'package:badges/badges.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../bloc/storefront_bloc.dart';
import '../../../../pages/login/bloc/auth_bloc.dart';
import '../../../custom_text_buttom.dart';
import '../../../login_area.dart';
import 'category_bar.dart';
import 'search_field.dart';

class AppBarDesktop extends StatefulWidget {
  final List<Category>? categories;
  const AppBarDesktop({this.categories, super.key});

  @override
  State<AppBarDesktop> createState() => _AppBarDesktopState();
}

class _AppBarDesktopState extends State<AppBarDesktop> {
  Widget hoverWidget = const SizedBox.shrink();
  bool subHeight = true;

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).appBarTheme.iconTheme!.color;
    final iconSize = Theme.of(context).appBarTheme.iconTheme!.size;
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    final unactiveText = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: const Color(0xff8f8f8f), fontSize: 14);
    final activeText =
        Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14);
    List<String> pageRoute = beamState.pathPatternSegments;
    bool isHome = listEquals(pageRoute, []);
    bool isStore = listEquals(pageRoute, ['store']);
    bool isAbout = listEquals(pageRoute, ['about']);
    bool isPrivacy = listEquals(pageRoute, ['privacy']);
    return BlocBuilder<StorefrontBloc, StorefrontState>(
      builder: (context, state) {
        return _upperBody(context, isHome, activeText, unactiveText, isStore,
            isAbout, isPrivacy, iconColor, iconSize);
      },
    );
  }

  Card _upperBody(
      BuildContext context,
      bool isHome,
      TextStyle activeText,
      TextStyle unactiveText,
      bool isStore,
      bool isAbout,
      bool isPrivacy,
      Color? iconColor,
      double? iconSize) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const ContinuousRectangleBorder(),
      elevation: Theme.of(context).appBarTheme.elevation,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(children: [
                    const LoginArea(),
                    VerticalDivider(
                      width: 20,
                      color: Colors.grey.shade400,
                      endIndent: 10,
                      indent: 10,
                      thickness: 1,
                    ),
                    CustomTextButton(
                        showBottomLine: isHome,
                        backgroundColor: Colors.transparent,
                        onTap: () => Beamer.of(context).beamToNamed('/'),
                        text: Text(
                          "الرئيسية",
                          style: isHome ? activeText : unactiveText,
                        )),
                    CustomTextButton(
                        showBottomLine: isStore,
                        backgroundColor: Colors.transparent,
                        onTap: () => Beamer.of(context).beamToNamed('/store'),
                        text: Text(
                          "المتجر",
                          style: isStore ? activeText : unactiveText,
                        )),
                    CustomTextButton(
                      showBottomLine: isAbout,
                      backgroundColor: Colors.transparent,
                      onTap: () => Beamer.of(context).beamToNamed('/about'),
                      text: Text(
                        "تواصل معنا",
                        style: isAbout ? activeText : unactiveText,
                      ),
                    ),
                    // CustomTextButton(
                    //   showBottomLine: isPrivacy,
                    //   backgroundColor: Colors.transparent,
                    //   onTap: () => launchUrlString('https://sites.google.com/view/hawari-privacy/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9'),
                    //   text: Text(
                    //     "سياسة الخصوصية",
                    //     style: isPrivacy ? activeText : unactiveText,
                    //   ),
                    // ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SearchField(
                        fetch: (searchQuery) => context
                            .read<StorefrontBloc>()
                            .searchProducts(term: searchQuery, amount: 10),
                      ),
                    ),
                  ]),
                ),
                FutureBuilder(
                    future: context.read<AuthBloc>().localAccount(),
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () => Beamer.of(context)
                                  .beamToNamed('/account', data: snapshot.data),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    Ionicons.person_outline,
                                    color: iconColor,
                                    size: iconSize,
                                  )),
                            ),
                            snapshot.hasData &&
                                    snapshot.data!.checkouts.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      Beamer.of(context).beamToNamed('/cart');
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Badge(
                                            badgeContent: Text(
                                              snapshot
                                                  .data!.checkouts[0].quantity
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                            ),
                                            badgeStyle: BadgeStyle(
                                                badgeColor:
                                                    StoreTheme.tentColor),
                                            child: const Icon(
                                                Ionicons.bag_outline))))
                                : InkWell(
                                    onTap: () {
                                      Beamer.of(context).beamToNamed('/cart');
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child:
                                            const Icon(Ionicons.bag_outline))),
                            // Icon(
                            //   Ionicons.heart_outline,
                            //   color: iconColor,
                            //   size: iconSize,
                            // ),
                          ],
                        ),
                      );
                    }),
                Expanded(
                  // Logo
                  flex: 1,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Beamer.of(context).beamToNamed('/'),
                      child: Container(
                        height: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image:
                                    AssetImage('assets/image/logo_wide.png'))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40, child: _bottomBody()),
            hoverWidget
          ],
        ),
      ),
    );
  }

  Widget _bottomBody() {
    return widget.categories != null
        ? CategoryBar(
            categories: widget.categories!,
            onHover: (hovered, category) {
              if (category.childern != null) {
                subHeight = true;
                hoverWidget = AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  color: const Color(0xffededed),
                  height: subHeight ? 40 : 0,
                  width: double.infinity,
                  child: Center(
                    child: CategoryBar(
                        fontColor: StoreTheme.tentColor,
                        onHover: (hovered, category) {},
                        categories: category.childern!),
                  ),
                );
              } else {
                hoverWidget = const SizedBox.shrink();
                subHeight = false;
              }
              setState(() {});
            },
          )
        : const SizedBox.shrink();
  }
}
