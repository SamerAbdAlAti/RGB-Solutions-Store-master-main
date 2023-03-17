import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_zoom_on_move/image_zoom_on_move.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../../../../../../core/theme/app_theme.dart';

class MediaSelector extends StatefulWidget {
  const MediaSelector(
      {super.key,
      required this.mediaUrls,
      this.height = 300,
      this.isMobile = false});
  final List<String> mediaUrls;
  final double height;
  final bool isMobile;

  @override
  State<MediaSelector> createState() => _MediaSelectorState();
}

class _MediaSelectorState extends State<MediaSelector> {
  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return _fullWidget();
  }

  Widget _fullWidget() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: widget.isMobile ? 60 : 100,
              height: widget.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Wrap(
                      runSpacing: widget.isMobile ? 2 : 8,
                      spacing: widget.isMobile ? 2 : 8,
                      direction: Axis.vertical,
                      children: [
                        for (String url in widget.mediaUrls)
                          _squareImage(
                              widget.mediaUrls
                                  .indexWhere((element) => element == url),
                              url),
                      ]),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: widget.height,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  widget.isMobile
                      ? PinchZoom(
                          child: Image.network(
                          widget.mediaUrls[_selectedImage],
                          fit: BoxFit.contain,
                        ))
                      : ImageZoomOnMove(
                          cursor: SystemMouseCursors.move,
                          image: Image.network(
                            widget.mediaUrls[_selectedImage],
                            fit: BoxFit.contain,
                          ),
                        ),
                  IgnorePointer(
                    child: Image.asset('assets/image/pattern pic.png',
                        fit: BoxFit.cover,
                        opacity: const AlwaysStoppedAnimation(0.5)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _squareImage(int index, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() {
          _selectedImage = index;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: widget.isMobile ? 40 : 50,
          height: widget.isMobile ? 40 : 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _selectedImage == index
                ? [
                    BoxShadow(
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        blurStyle: BlurStyle.solid,
                        color: StoreTheme.breakerColor)
                  ]
                : null,
            border: Border.all(
              color: Colors.black45,
            ),
            image: DecorationImage(
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(_selectedImage == index ? 1 : 0.6),
                  BlendMode.dstATop),
              image: CachedNetworkImageProvider(url),
            ),
          ),
        ),
      ),
    );
  }
}
