// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i6;
import 'package:saleor_app_flutter/core/injectable/register_module.dart'
    as _i58;
import 'package:saleor_app_flutter/core/network/network_info.dart' as _i7;
import 'package:saleor_app_flutter/core/utl/phone_converter.dart' as _i9;
import 'package:saleor_app_flutter/features/storefront/data/datasource/local_auth_datasource.dart'
    as _i17;
import 'package:saleor_app_flutter/features/storefront/data/datasource/order_datasource.dart'
    as _i8;
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_auth_datasource.dart'
    as _i18;
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_checkout_datasource.dart'
    as _i10;
import 'package:saleor_app_flutter/features/storefront/data/datasource/store_information_datasource.dart'
    as _i11;
import 'package:saleor_app_flutter/features/storefront/data/datasource/storefront_remote_datasource.dart'
    as _i14;
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_auth_repository.dart'
    as _i20;
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_checkout_repository.dart'
    as _i23;
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_order_repository.dart'
    as _i39;
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_store_information_repository.dart'
    as _i13;
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_storefront_repository.dart'
    as _i16;
import 'package:saleor_app_flutter/features/storefront/domain/repositories/auth_repository.dart'
    as _i19;
import 'package:saleor_app_flutter/features/storefront/domain/repositories/checkout_repository.dart'
    as _i22;
import 'package:saleor_app_flutter/features/storefront/domain/repositories/order_repository.dart'
    as _i38;
import 'package:saleor_app_flutter/features/storefront/domain/repositories/store_information_repository.dart'
    as _i12;
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart'
    as _i15;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/check_if_user_exist_usecase.dart'
    as _i21;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/local_account_usecase.dart'
    as _i34;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/login_usecase.dart'
    as _i35;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/logout_usecase.dart'
    as _i36;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/online_accoute_usecase.dart'
    as _i37;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/register_usecase.dart'
    as _i41;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/add_cobon_usecase.dart'
    as _i51;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/add_to_cart_usecase.dart'
    as _i53;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/remove_cobon_usecase.dart'
    as _i42;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/remove_from_cart_usecase.dart'
    as _i43;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/update_checkout_address_usecase.dart'
    as _i49;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/update_product_to_cart.dart'
    as _i50;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/add_notes_usercase.dart'
    as _i52;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/get_ready_orders_usecase.dart'
    as _i56;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/place_order_usecase.dart'
    as _i40;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/store_information/get_home_huge_poster_usecase.dart'
    as _i26;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/store_information/get_home_snaplist_poster_usecase.dart'
    as _i27;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/store_information/get_home_wall_poster_usecase.dart'
    as _i28;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_categories_usecase.dart'
    as _i24;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_collections_usecase.dart'
    as _i25;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_products_usecase.dart'
    as _i29;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_category_filtered.dart'
    as _i30;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_category_usecase.dart'
    as _i31;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_collection_usecase.dart'
    as _i32;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_product_usecase.dart'
    as _i33;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_categories_usecase.dart'
    as _i44;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_collections_usecase.dart'
    as _i45;
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_products_usecase.dart'
    as _i46;
import 'package:saleor_app_flutter/features/storefront/presentation/bloc/storefront_bloc.dart'
    as _i48;
import 'package:saleor_app_flutter/features/storefront/presentation/cubit/store_information_cubit.dart'
    as _i47;
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/bloc/order_bloc.dart'
    as _i57;
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/bloc/cart_bloc.dart'
    as _i55;
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart'
    as _i54;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.FirebaseFirestore>(
      () => registerModule.firestoreInstance);
  gh.lazySingleton<_i4.FlutterSecureStorage>(
      () => registerModule.secureStorageInstance);
  gh.lazySingleton<_i5.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i6.InternetConnectionCheckerPlus>(
      () => registerModule.connectionChecker);
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.INetworkInfo(gh<_i6.InternetConnectionCheckerPlus>()));
  gh.lazySingleton<_i8.OrderDatasource>(() => _i8.IOrderDatasource());
  gh.lazySingleton<_i9.PhoneConverter>(() => _i9.PhoneConverter());
  gh.lazySingleton<_i10.RemoteCheckoutDatasource>(
      () => _i10.IRemoteCheckoutDatasource());
  gh.lazySingleton<_i11.StoreInformationDatasource>(
      () => _i11.IStoreInformationDatasource(gh<_i3.FirebaseFirestore>()));
  gh.lazySingleton<_i12.StoreInformationRepository>(() =>
      _i13.IStoreInformationRepository(
          datasource: gh<_i11.StoreInformationDatasource>()));
  gh.lazySingleton<_i14.StorefrontRemoteDatasource>(
      () => _i14.IStorefrontRemoteDatasource(gh<_i5.GraphQLClient>()));
  gh.lazySingleton<_i15.StorefrontRepository>(() => _i16.IStorefrontRepository(
        remoteDataSource: gh<_i14.StorefrontRemoteDatasource>(),
        networkInfo: gh<_i7.NetworkInfo>(),
      ));
  gh.lazySingleton<_i17.AuthLocalDatasource>(
      () => _i17.IAuthLocalDatasource(gh<_i4.FlutterSecureStorage>()));
  gh.lazySingleton<_i18.AuthRemoteDatasource>(
      () => _i18.IAuthDatasource(gh<_i5.GraphQLClient>()));
  gh.lazySingleton<_i19.AuthRepository>(() => _i20.IAuthRepository(
        gh<_i17.AuthLocalDatasource>(),
        gh<_i18.AuthRemoteDatasource>(),
      ));
  gh.lazySingleton<_i21.CheckIfUserExistUseCase>(
      () => _i21.CheckIfUserExistUseCase(gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i22.CheckoutRepository>(() => _i23.ICheckoutRepository(
        gh<_i10.RemoteCheckoutDatasource>(),
        gh<_i18.AuthRemoteDatasource>(),
        gh<_i17.AuthLocalDatasource>(),
      ));
  gh.lazySingleton<_i24.GetCategoriesUseCase>(
      () => _i24.GetCategoriesUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i25.GetCollectionsUseCase>(
      () => _i25.GetCollectionsUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i26.GetHomeHugePosterUseCase>(() =>
      _i26.GetHomeHugePosterUseCase(gh<_i12.StoreInformationRepository>()));
  gh.lazySingleton<_i27.GetHomeSnapListPosterUseCase>(() =>
      _i27.GetHomeSnapListPosterUseCase(gh<_i12.StoreInformationRepository>()));
  gh.lazySingleton<_i28.GetHomeWallPosterUseCase>(() =>
      _i28.GetHomeWallPosterUseCase(gh<_i12.StoreInformationRepository>()));
  gh.lazySingleton<_i29.GetProductsUseCase>(
      () => _i29.GetProductsUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i30.GetSingleCategoryFilteredUseCase>(() =>
      _i30.GetSingleCategoryFilteredUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i31.GetSingleCategoryUseCase>(
      () => _i31.GetSingleCategoryUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i32.GetSingleCollectionUseCase>(
      () => _i32.GetSingleCollectionUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i33.GetSingleProductUseCase>(
      () => _i33.GetSingleProductUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i34.LocalAccountUseCase>(
      () => _i34.LocalAccountUseCase(gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i35.LoginUseCase>(
      () => _i35.LoginUseCase(gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i36.LogoutUseCase>(
      () => _i36.LogoutUseCase(gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i37.OnlineAccountUseCase>(
      () => _i37.OnlineAccountUseCase(gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i38.OrderRepository>(() => _i39.IOrderRepository(
        gh<_i8.OrderDatasource>(),
        gh<_i17.AuthLocalDatasource>(),
      ));
  gh.lazySingleton<_i40.PlaceOrderUseCase>(
      () => _i40.PlaceOrderUseCase(gh<_i38.OrderRepository>()));
  gh.lazySingleton<_i41.RegisterUseCase>(
      () => _i41.RegisterUseCase(gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i42.RemoveCobonUseCase>(
      () => _i42.RemoveCobonUseCase(gh<_i22.CheckoutRepository>()));
  gh.lazySingleton<_i43.RemoveFromCartUsecase>(
      () => _i43.RemoveFromCartUsecase(gh<_i22.CheckoutRepository>()));
  gh.lazySingleton<_i44.SearchCategoriesUseCase>(
      () => _i44.SearchCategoriesUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i45.SearchCollectionsUseCase>(
      () => _i45.SearchCollectionsUseCase(gh<_i15.StorefrontRepository>()));
  gh.lazySingleton<_i46.SearchProdcutsUseCase>(
      () => _i46.SearchProdcutsUseCase(gh<_i15.StorefrontRepository>()));
  gh.factory<_i47.StoreInformationCubit>(() => _i47.StoreInformationCubit(
        gh<_i26.GetHomeHugePosterUseCase>(),
        gh<_i27.GetHomeSnapListPosterUseCase>(),
        gh<_i28.GetHomeWallPosterUseCase>(),
      ));
  gh.factory<_i48.StorefrontBloc>(() => _i48.StorefrontBloc(
        gh<_i29.GetProductsUseCase>(),
        gh<_i33.GetSingleProductUseCase>(),
        gh<_i24.GetCategoriesUseCase>(),
        gh<_i31.GetSingleCategoryUseCase>(),
        gh<_i46.SearchProdcutsUseCase>(),
        gh<_i32.GetSingleCollectionUseCase>(),
        gh<_i25.GetCollectionsUseCase>(),
        gh<_i30.GetSingleCategoryFilteredUseCase>(),
        gh<_i44.SearchCategoriesUseCase>(),
        gh<_i45.SearchCollectionsUseCase>(),
      ));
  gh.lazySingleton<_i49.UpdateCheckoutAddressUseCase>(
      () => _i49.UpdateCheckoutAddressUseCase(gh<_i22.CheckoutRepository>()));
  gh.lazySingleton<_i50.UpdateProductToCartUsecase>(
      () => _i50.UpdateProductToCartUsecase(gh<_i22.CheckoutRepository>()));
  gh.lazySingleton<_i51.AddCobonUseCase>(
      () => _i51.AddCobonUseCase(gh<_i22.CheckoutRepository>()));
  gh.lazySingleton<_i52.AddNotesUseCase>(
      () => _i52.AddNotesUseCase(gh<_i38.OrderRepository>()));
  gh.lazySingleton<_i53.AddToCartUsecase>(
      () => _i53.AddToCartUsecase(gh<_i22.CheckoutRepository>()));
  gh.factory<_i54.AuthBloc>(() => _i54.AuthBloc(
        gh<_i35.LoginUseCase>(),
        gh<_i41.RegisterUseCase>(),
        gh<_i36.LogoutUseCase>(),
        gh<_i34.LocalAccountUseCase>(),
        gh<_i9.PhoneConverter>(),
        gh<_i21.CheckIfUserExistUseCase>(),
        gh<_i37.OnlineAccountUseCase>(),
      ));
  gh.factory<_i55.CartBloc>(() => _i55.CartBloc(
        gh<_i53.AddToCartUsecase>(),
        gh<_i50.UpdateProductToCartUsecase>(),
        gh<_i43.RemoveFromCartUsecase>(),
        gh<_i49.UpdateCheckoutAddressUseCase>(),
        gh<_i40.PlaceOrderUseCase>(),
        gh<_i51.AddCobonUseCase>(),
        gh<_i42.RemoveCobonUseCase>(),
      ));
  gh.lazySingleton<_i56.GetReadyOrdersUseCase>(
      () => _i56.GetReadyOrdersUseCase(gh<_i38.OrderRepository>()));
  gh.factory<_i57.OrderBloc>(
      () => _i57.OrderBloc(gh<_i40.PlaceOrderUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i58.RegisterModule {}
