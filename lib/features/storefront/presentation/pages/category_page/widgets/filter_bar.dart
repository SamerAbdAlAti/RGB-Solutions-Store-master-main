import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_theme.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<double> _values = [];
  @override
  void initState() {
    _values = [0, 100];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "السعر",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
        ),
        SizedBox(
          width: 300,
          child: FlutterSlider(
            values: _values,
            rangeSlider: true,
            handlerWidth: 20,
            handlerHeight: 20,
            rightHandler: FlutterSliderHandler(
                decoration: BoxDecoration(
                    color: StoreTheme.tentColor,
                    borderRadius: BorderRadius.circular(30))),
            handler: FlutterSliderHandler(
                decoration: BoxDecoration(
                    color: StoreTheme.tentColor,
                    borderRadius: BorderRadius.circular(30))),
            trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black)),
            max: 100,
            min: 0,
            rtl: true,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _values = [upperValue, lowerValue];
              setState(() {});
            },
          ),
        )
      ],
    );
  }
}
