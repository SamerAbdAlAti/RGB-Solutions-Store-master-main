import 'package:badges/badges.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/login_area.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../domain/entities/user.dart';
import '../../bloc/storefront_bloc.dart';
import '../../pages/login/bloc/auth_bloc.dart';
import 'widgets/desktop/category_bar.dart';
import 'widgets/desktop/search_field.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    List<String> pageRoute = beamState.pathPatternSegments;
    bool isHome = listEquals(pageRoute, []);
    bool isStore = listEquals(pageRoute, ['store']);
    bool isAbout = listEquals(pageRoute, ['about']);
    bool isAccount = listEquals(pageRoute, ['account']);
    bool isPrivacy = listEquals(pageRoute, ['privacy']);
    return Drawer(
      child: Column(children: [
        SizedBox(
            width: 200,
            height: 200,
            child: InkWell(
                onTap: () => Beamer.of(context).beamToReplacementNamed('/'),
                child: Image.asset(
                  'assets/image/logo.png',
                  fit: BoxFit.contain,
                ))),
        const SizedBox(height: 20),
        const LoginArea(isMobile: true),
        Divider(
          indent: 50,
          endIndent: 50,
          thickness: 1,
          height: 20,
          color: StoreTheme.unselectedColor,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              _buildMenuItem(
                context,
                text: "الرئيسية",
                isSelected: isHome,
                icon: Ionicons.home_outline,
                onTap: () => Beamer.of(context).beamToNamed('/'),
              ),
              _buildMenuItem(
                context,
                text: "المتجر",
                isSelected: isStore,
                icon: Ionicons.storefront_outline,
                onTap: () => Beamer.of(context).beamToNamed('/store'),
              ),
              _buildMenuItem(
                context,
                text: "عن المتجر",
                isSelected: isAbout,
                icon: Ionicons.information_outline,
                onTap: () => Beamer.of(context).beamToNamed('/about'),
              ),
              _buildMenuItem(
                context,
                text: "حسابي",
                isSelected: isAccount,
                icon: Ionicons.person_outline,
                onTap: () => Beamer.of(context).beamToNamed('/account'),
              ),
              _buildMenuItem(
                context,
                text: "سياسة الخصوصية",
                isSelected: isPrivacy,
                icon: Icons.privacy_tip,
                onTap: () => launchUrlString('https://sites.google.com/view/hawari-privacy/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9'),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required String text,
      required bool isSelected,
      required IconData icon,
      required void Function() onTap}) {
    final color = isSelected ? StoreTheme.tentColor : StoreTheme.commonColor;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.black12,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => onTap(),
      ),
    );
  }
}

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppbar({super.key});

  @override
  State<MobileAppbar> createState() => _MobileAppbarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _MobileAppbarState extends State<MobileAppbar> {
  User? user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: SearchField(
                isMobile: true,
                fetch: (searchQuery) => context
                    .read<StorefrontBloc>()
                    .searchProducts(term: searchQuery, amount: 10)),
          ),
          // const IconButton(onPressed: null, icon: Icon(Ionicons.heart_outline)),
          FutureBuilder(
            future: user != null
                ? Future.value(user)
                : context.read<AuthBloc>().localAccount(),
            builder: (context, snapshot) {
              try {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  user = snapshot.data;
                  return IconButton(
                    onPressed: () => Beamer.of(context).beamToNamed('/cart'),
                    icon: snapshot.hasData &&
                            snapshot.data!.checkouts.isNotEmpty
                        ? Badge(
                            badgeContent: Text(
                              snapshot.data!.checkouts[0].quantity.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.white, fontSize: 10),
                            ),
                            badgeStyle:
                                BadgeStyle(badgeColor: StoreTheme.tentColor),
                            child: const Icon(Ionicons.bag_outline))
                        : const Icon(Ionicons.bag_outline),
                  );
                }
                if (snapshot.hasError) {
                  return IconButton(
                      onPressed: () => Beamer.of(context).beamToNamed('/cart'),
                      icon: const Icon(Ionicons.bag_outline));
                }
                return IconButton(
                    onPressed: () => Beamer.of(context).beamToNamed('/cart'),
                    icon: const Icon(Ionicons.bag_outline));
              } catch (e) {
                return IconButton(
                    onPressed: () => Beamer.of(context).beamToNamed('/cart'),
                    icon: const Icon(Ionicons.bag_outline));
              }
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Expanded(
            child: FutureBuilder(
                future: context.read<StorefrontBloc>().getCategories(
                    amount: 20,
                    channel: 'default-channel',
                    amountOfProducts: 1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return snapshot.data != null
                        ? CategoryBar(
                            categories: snapshot.data!,
                            onHover: (hovered, category) {},
                            isMobile: true,
                            fontSize: 12,
                          )
                        : const SizedBox.shrink();
                  }
                  return const SizedBox.shrink();
                }),
          ),
        ));
  }
}
