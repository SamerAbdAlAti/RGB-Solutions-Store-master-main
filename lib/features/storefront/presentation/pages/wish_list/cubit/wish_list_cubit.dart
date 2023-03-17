import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list_state.dart';
part 'wish_list_cubit.freezed.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(const WishListState.idle());
}
