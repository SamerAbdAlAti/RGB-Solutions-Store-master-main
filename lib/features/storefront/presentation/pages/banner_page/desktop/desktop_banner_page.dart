import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:ionicons/ionicons.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:saleor_app_flutter/core/types/permission_enum.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/poster_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/collection.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/bloc/storefront_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/cubit/store_information_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/banner_page/cubit/banner_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/home/widgets/wall_banner/wall_banner.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/bordered_button.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/category_grid_widget/widgets/radio_bar_category.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/dialog_manager.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/simple_wide_banner.dart';

import '../../../../domain/entities/user.dart';
import '../../../widgets/footer_wrapper.dart';
import '../../../widgets/hover_options.dart';
import '../widgets/desktop_home_replica.dart';

class DesktopBanner extends StatefulWidget {
  const DesktopBanner({super.key});

  @override
  State<DesktopBanner> createState() => _DesktopBannerState();
}

class _DesktopBannerState extends State<DesktopBanner> {
  String _selectedValue = "huge";
  List<Poster> _hugePosters = [];
  List<Poster> _wallPosters = [];
  List<Poster> _snaplistPosters = [];
  bool assing = false;
  late BannerCubit _cubit;

  late RouteType _selectedType;
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _cubit = BannerCubit()..initPosters(allPostersFetch(context));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: const StorefrontAppBar(),
            body: FooterWrapper(
              child: FutureBuilder(
                  future: context.read<AuthBloc>().localAccount(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isStaff &&
                          snapshot.data!.userPermission
                              .contains(PermissionEnum.MANAGE_PAGES)) {
                        return _cubitBuilder(context, snapshot.data!);
                      } else {
                        Beamer.of(context).beamToReplacementNamed('/');
                      }
                    }
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData == false) {
                      return _premoteToLogin(context);
                    }
                    return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2));
                  }),
            )));
  }

  Widget _premoteToLogin(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Beamer.of(context).beamToNamed('/login');
    });
    return const SizedBox.shrink();
  }

  Future<Tuple3<List<Poster>, List<Poster>, List<Poster>>> allPostersFetch(
      BuildContext context) async {
    var cubitFunction = context.read<StoreInformationCubit>();
    final firstGroup = await cubitFunction.getHomeHugePoster();
    final secondGroup = await cubitFunction.getHomeWallPoster();
    final thirdGroup = await cubitFunction.getHomeListPoster();
    return tuple3(firstGroup, secondGroup, thirdGroup);
  }

  Future<Uint8List?> _pickFile() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['jpg', 'png'],
    );
    XFile? imageFile = await openFile(acceptedTypeGroups: [typeGroup]);
    Uint8List? imageBytes =
        imageFile != null ? await imageFile.readAsBytes() : null;

    return imageBytes;
  }

  Widget _cubitBuilder(BuildContext context, User user) {
    return BlocBuilder<BannerCubit, BannerState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.map(
          initial: (value) => _fullWidget(context, user),
          saved: (value) {
            if (!assing) {
              assing = true;
              _hugePosters = value.posters.value1;
              _wallPosters = value.posters.value2;
              _snaplistPosters = value.posters.value3;
            }
            return _fullWidget(context, user);
          },
          loading: (value) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          error: (value) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              DialogManager.errorDialog(
                  context: context, description: value.message, title: "خطأ");
            });
            return _fullWidget(context, user);
          },
        );
      },
    );
  }

  Widget _fullWidget(BuildContext context, User user) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
            child: SizedBox(
          width: screenSize.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(children: [
                            const Text("التعديلات"),
                            RadioBarCategory(
                              buttonLables: const [
                                'المجموعة الأولى',
                                'المجموعة الثانية',
                                'المجموعة الثالثة'
                              ],
                              buttonValues: const ["huge", "wall", "snaplist"],
                              defaultButtonValue: "huge",
                              onValue: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            const SizedBox(height: 25),
                            _switchPages(context, _selectedValue)
                          ]),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: const EdgeInsets.only(
                                  top: 1, right: 20, left: 20, bottom: 20),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        color: Colors.black26)
                                  ],
                                  color: Theme.of(context).cardTheme.color,
                                  borderRadius: BorderRadius.circular(5)),
                              child: DesktopHomeReplica(posters: _getTuple)))
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }

  Widget _switchPages(BuildContext context, String value) {
    switch (value) {
      case "huge":
        return _hugeDetails(context);
      case "wall":
        return _wallDetails(context, _wallPosters);
      case "snaplist":
        return _snaplistDetails(context);
      default:
        //huge
        return _hugeDetails(context);
    }
  }

  Widget _snaplistDetails(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var poster in _snaplistPosters)
              _snaplistOptions(poster, _snaplistPosters.indexOf(poster)),
            const SizedBox(height: 20),
          ],
        ),
        const SizedBox(height: 30),
        BorderedButton(
          text: "اضافة",
          width: 75,
          positive: true,
          onPressed: () => _addAction(_snaplistPosters,
              width: 170, height: 200, hideAllExceptProduct: true),
        )
      ],
    );
  }

  String selectedType = "product";

  Widget _snaplistOptions(Poster poster, int index) {
    return SizedBox(
      width: 170,
      height: 200,
      child: OnHoverOptions(
        actions: [
          BorderedButton(
              text: "تبديل الصور",
              positive: true,
              onPressed: () => _replaceAction(_snaplistPosters, index)),
          BorderedButton(
              text: "ربط بمنتج / صنف",
              positive: true,
              onPressed: () {
                _selectedId = '';
                _selectedType = RouteType.product;
                _linkItems(_snaplistPosters, index, poster.mediaUrl,
                    width: 170, height: 200);
              }),
          BorderedButton(
              text: "حذف",
              onPressed: () => _deleteAction(_snaplistPosters, index)),
        ],
        child: index == (_snaplistPosters.length / 2).round() - 1
            ? Badge(
                label: const Text("وسط"),
                child: AspectRatio(
                    aspectRatio: 850 / 1000,
                    child: CachedNetworkImage(
                      imageUrl: poster.mediaUrl,
                    )),
              )
            : AspectRatio(
                aspectRatio: 850 / 1000,
                child: CachedNetworkImage(
                  imageUrl: poster.mediaUrl,
                ),
              ),
      ),
    );
  }

  Widget _hugeDetails(BuildContext context) {
    return Column(
      children: [
        for (var poster in _hugePosters)
          _hugeOptions(poster, _hugePosters.indexOf(poster)),
        const SizedBox(height: 20),
        BorderedButton(
          text: "اضافة",
          width: 75,
          positive: true,
          onPressed: () => _addAction(_hugePosters),
        ),
      ],
    );
  }

  Widget _hugeOptions(Poster poster, int index) {
    return OnHoverOptions(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        BorderedButton(
            text: "تبديل الصور",
            positive: true,
            onPressed: () => _replaceAction(_hugePosters, index)),
        BorderedButton(
            text: "ربط بمنتج / صنف",
            positive: true,
            onPressed: () {
              _selectedId = '';
              _selectedType = RouteType.product;

              _linkItems(_hugePosters, index, poster.mediaUrl);
            }),
        BorderedButton(
            text: "حذف", onPressed: () => _deleteAction(_hugePosters, index)),
      ],
      child: SimpleWideBanner(
        outOfTheScreen: 1,
        fit: BoxFit.contain,
        routeId: "",
        routeType: RouteType.unclickable,
        mediaUrls: [poster.mediaUrl],
      ),
    );
  }

  Widget _wallDetails(BuildContext context, List<Poster> posters) {
    var split = posters.slices(5);
    return Column(
      children: [
        for (var chunk in split)
          WallBanner(
              fetch: Future.value(chunk),
              aspectRatio: 300 / 200,
              staticMode: true,
              customStones: chunk
                  .map((e) => _stones(
                      context,
                      e,
                      _wallPosters.indexWhere((element) => element == e),
                      chunk.indexWhere((element) => element == e)))
                  .toList()),
        const SizedBox(height: 40),
        BorderedButton(
          text: "اضافة",
          width: 75,
          positive: true,
          onPressed: () => _addAction(_wallPosters, width: 80, height: 160),
        ),
      ],
    );
  }

  Stone _stones(
      BuildContext context, Poster poster, int index, int localIndex) {
    return Stone(
      id: index,
      width: 1,
      height: localIndex == 2 ? 2 : 1,
      child: OnHoverOptions(
        actions: [
          BorderedButton(
              text: "تبديل الصور",
              positive: true,
              onPressed: () => _replaceAction(_wallPosters, index)),
          BorderedButton(
              text: "ربط بمنتج / صنف",
              positive: true,
              onPressed: () {
                _selectedId = '';
                _selectedType = RouteType.product;

                _linkItems(_wallPosters, index, poster.mediaUrl,
                    height: localIndex == 2 ? 160 : 80, width: 80);
              }),
          BorderedButton(
              text: "حذف", onPressed: () => _deleteAction(_wallPosters, index)),
        ],
        child: AspectRatio(
          aspectRatio: localIndex == 2 ? 1 / 2 : 1 / 1,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(poster.mediaUrl),
                    fit: BoxFit.cover)),
            child: Text(
              (localIndex + 1).toString(),
            ),
          ),
        ),
      ),
    );
  }

  void _deleteAction(List<Poster> refList, int index) async {
    await _cubit.deleteImage(refList[index].mediaUrl);
    refList.removeAt(index);
    _cubit.uploadChanges(_getTuple);
  }

  void _replaceAction(List<Poster> refList, int index) async {
    final newImage = await _cubit.uploadImageGetUrl(await _pickFile());
    if (newImage != null) {
      await _cubit.deleteImage(refList[index].mediaUrl);
      refList[index].mediaUrl = newImage;
      _cubit.uploadChanges(_getTuple);
    }
  }

  void _addAction(List<Poster> refList,
      {double width = 280,
      double height = 80,
      bool hideAllExceptProduct = false}) async {
    final imageUrl = await _cubit.uploadImageGetUrl(await _pickFile());
    if (imageUrl != null) {
      _selectedType = RouteType.product;
      await _linkItems(
          refList, refList.isNotEmpty ? refList.length - 1 : 0, imageUrl,
          hideAllExceptProduct: hideAllExceptProduct, newItem: true);
      if (_selectedId != null) {
        refList.add(PosterModel(
            routeId: _selectedId!,
            routeType: _selectedType,
            mediaUrl: imageUrl));
        _cubit.uploadChanges(_getTuple);
      }
    }
  }

  Tuple3<List<Poster>, List<Poster>, List<Poster>> get _getTuple =>
      tuple3(_hugePosters, _wallPosters, _snaplistPosters);

  Widget _searchWidgetProduct() {
    return DropdownSearch<Product>(
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration:
              CustomInputDecorations.desktopInputDecoration(
                  'اختر منتجًا', Ionicons.search_outline)),
      popupProps: PopupProps.modalBottomSheet(
        showSearchBox: true,
        isFilterOnline: true,
        itemBuilder: (context, item, isSelected) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              horizontalTitleGap: 10,
              onTap: () => Navigator.of(context).pop(),
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                item.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 15),
              ),
              leading: AspectRatio(
                aspectRatio: 2 / 1,
                child: item.thumbnail.isEmpty
                    ? Image.asset('assets/image/logo.png', fit: BoxFit.contain)
                    : CachedNetworkImage(
                        imageUrl: item.thumbnail,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          );
        },
      ),
      onChanged: (newValue) {
        if (newValue != null) _selectedId = newValue.id;
      },
      asyncItems: (String term) =>
          context.read<StorefrontBloc>().searchProducts(term: term, amount: 50),
      itemAsString: (item) => item.name,
    );
  }

  Widget _searchWidgetCategory() {
    return DropdownSearch<Category>(
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration:
              CustomInputDecorations.desktopInputDecoration(
                  'اختر صنفًا', Ionicons.search_outline)),
      popupProps: PopupProps.modalBottomSheet(
        showSearchBox: true,
        isFilterOnline: true,
        itemBuilder: (context, item, isSelected) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              horizontalTitleGap: 20,
              onTap: () => Navigator.of(context).pop(),
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                item.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 15),
              ),
            ),
          );
        },
      ),
      onChanged: (newValue) {
        if (newValue != null) _selectedId = newValue.id;
      },
      asyncItems: (String term) => context
          .read<StorefrontBloc>()
          .searchCategories(term: term, amount: 50),
      itemAsString: (item) => item.name,
    );
  }

  Widget _searchWidgetCollection() {
    return DropdownSearch<Collection>(
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration:
              CustomInputDecorations.desktopInputDecoration(
                  'اختر قائمة عروض', Ionicons.search_outline)),
      popupProps: PopupProps.modalBottomSheet(
        showSearchBox: true,
        isFilterOnline: true,
        itemBuilder: (context, item, isSelected) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              horizontalTitleGap: 20,
              onTap: () => Navigator.of(context).pop(),
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                item.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 15),
              ),
            ),
          );
        },
      ),
      onChanged: (newValue) {
        if (newValue != null) _selectedId = newValue.id;
      },
      asyncItems: (String term) => context
          .read<StorefrontBloc>()
          .searchCollections(term: term, amount: 50),
      itemAsString: (item) => item.name,
    );
  }

  Future<void> _linkItems(List<Poster> listRef, int index, String imageUrl,
      {double width = 280,
      double height = 80,
      bool newItem = false,
      bool hideAllExceptProduct = false}) async {
    await Dialogs.materialDialog(
        context: context,
        title: "اختر نوع الرابط",
        dialogWidth: 500,
        actions: [
          StatefulBuilder(builder: (context, setState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("الصورة المختارة"),
                      SizedBox(
                        width: width,
                        height: height,
                        child: CachedNetworkImage(imageUrl: imageUrl),
                      )
                    ],
                  ),
                  hideAllExceptProduct
                      ? const SizedBox.shrink()
                      : RadioBarCategory(
                          buttonLables: const [
                            "منتج",
                            "صنف",
                            "عروض",
                            "صورة فقط"
                          ],
                          buttonValues: const [
                            "product",
                            "category",
                            "collection",
                            "image"
                          ],
                          defaultButtonValue: "product",
                          onValue: (value) {
                            switch (value) {
                              case "product":
                                _selectedType = RouteType.product;
                                break;

                              case "collection":
                                _selectedType = RouteType.collection;
                                break;

                              case "category":
                                _selectedType = RouteType.category;
                                break;

                              case "image":
                                _selectedType = RouteType.unclickable;
                                break;
                            }
                            setState(() {
                              selectedType = value;
                            });
                          },
                        ),
                  const SizedBox(height: 25),
                  selectedType == "product"
                      ? _searchWidgetProduct()
                      : selectedType == "category"
                          ? _searchWidgetCategory()
                          : selectedType == "collection"
                              ? _searchWidgetCollection()
                              : const SizedBox.shrink(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BorderedButton(
                        text: "تطبيق",
                        width: 75,
                        onPressed: () {
                          if (!newItem) {
                            listRef[index].routeType = _selectedType;
                            listRef[index].routeId = _selectedId!;
                            _cubit.uploadChanges(_getTuple);
                          }
                          Navigator.of(context).pop();
                        },
                        positive: true,
                      ),
                      const SizedBox(width: 50),
                      BorderedButton(
                        text: "الغاء",
                        width: 75,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ]);
  }
}
