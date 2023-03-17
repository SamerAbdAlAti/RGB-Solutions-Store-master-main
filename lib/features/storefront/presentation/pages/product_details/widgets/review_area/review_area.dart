import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/types/permission_enum.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/review.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/product_details/widgets/review_area/cubit/review_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/bordered_button.dart';

import '../../../../../../../core/theme/app_theme.dart';
import '../../../login/bloc/auth_bloc.dart';
import '../../../order_details/widgets/order_details_util.dart';

class ReviewArea extends StatefulWidget {
  final Product product;
  final void Function(double avgRating) onAvgRating;
  final bool isMobile;
  const ReviewArea(
      {Key? key,
      required this.product,
      required this.onAvgRating,
      this.isMobile = false})
      : super(key: key);

  @override
  State<ReviewArea> createState() => _ReviewAreaState();
}

class _ReviewAreaState extends State<ReviewArea> {
  late ReviewCubit _cubit;
  late TextEditingController _messageController;
  double _starAmount = 1;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _messageController = TextEditingController();
    _cubit = ReviewCubit(context.read<AuthBloc>().localAccount)
      ..getProductReviews(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.map(
          initial: (value) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          loading: (value) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          loaded: (value) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              widget.onAvgRating(value.avgRating);
            });
            if (value.reviews.isEmpty) {
              return Column(
                children: [
                  _cubit.showReviewSection(
                          widget.product, value.reviews, value.user)
                      ? _fillComment()
                      : const SizedBox.shrink(),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text("لا يوجد تقيمات لهذا المنتج"),
                  ),
                ],
              );
            }
            return SingleChildScrollView(
                child: Column(
              children: [
                _cubit.showReviewSection(
                        widget.product, value.reviews, value.user)
                    ? _fillComment()
                    : const SizedBox.shrink(),
                const SizedBox(height: 20),
                for (Review review in value.reviews)
                  _createComment(
                      value.reviews, review, value.user?.userPermission ?? [])
              ],
            ));
          },
          error: (value) => const Center(
            child: SizedBox(
              width: 200,
              height: 100,
              child: Text("لا يوجد تقيمات لهذا المنتج"),
            ),
          ),
        );
      },
    );
  }

  Widget _fillComment() {
    return SizedBox(
      width: 450,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              RatingBar(
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                    full: Icon(Ionicons.star, color: StoreTheme.tentColor),
                    half: Icon(Ionicons.star_half, color: StoreTheme.tentColor),
                    empty: const Icon(Ionicons.star_outline)),
                onRatingUpdate: (value) {
                  _starAmount = value;
                },
                initialRating: 1,
                minRating: 1,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _messageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "يرجى ادخال رسالة تقيم";
                  }
                  return null;
                },
                decoration: CustomInputDecorations.desktopInputDecoration(
                    "رسالة التقيم", Ionicons.document_outline,
                    isDense: false, padding: const EdgeInsets.all(12)),
                maxLines: 4,
                cursorHeight: 30.0,
                style: TextStyle(color: Colors.black87, fontSize: 20.0),
              ),
              const SizedBox(height: 20),
              BorderedButton(
                  text: "ارسل التقيم",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _cubit.putAReview(
                          _messageController.text, _starAmount, widget.product);
                      _messageController.clear();
                    }
                  })
            ],
          )),
    );
  }

  Widget _createComment(
      List<Review> reviews, Review review, List<PermissionEnum>? permissions) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(8);
    bool showDelete = permissions != null && permissions.isNotEmpty
        ? permissions.contains(PermissionEnum.MANAGE_USERS)
        : false;
    return Container(
      height: widget.isMobile ? 120 : 200,
      padding: const EdgeInsets.all(6.0),
      margin: widget.isMobile
          ? const EdgeInsets.fromLTRB(6, 0, 6, 15)
          : const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: borderRadius,
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 5)]),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Ionicons.person_outline,
                      size: widget.isMobile ? 18 : 28),
                ),
                SelectableText(
                  "${review.firstName} ${review.lastName}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: widget.isMobile ? 12 : null),
                ),
                RatingBarIndicator(
                  itemBuilder: (context, index) =>
                      Icon(Ionicons.star, color: StoreTheme.tentColor),
                  itemCount: 5,
                  itemSize: widget.isMobile ? 12 : 14,
                  rating: review.rating,
                ),
                SelectableText(
                  OrderDetailsUtil().getDate(review.created),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.isMobile ? 10 : 14),
                ),
                Visibility(
                  visible: showDelete,
                  maintainSize: false,
                  child: IconButton(
                      onPressed: () {
                        _cubit.removeReviews(
                            widget.product, reviews, reviews.indexOf(review));
                      },
                      icon: Icon(
                        Ionicons.trash_bin_outline,
                        color: Colors.redAccent,
                        size: widget.isMobile ? 16 : 18,
                      )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SelectionArea(
                child: AutoSizeText(
                  review.reviewText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
