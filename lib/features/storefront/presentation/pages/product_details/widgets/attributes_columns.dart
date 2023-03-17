import 'package:flutter/material.dart';

import '../../../../domain/entities/attribute.dart';
import '../../../../domain/entities/attribute_value.dart';
import '../../cart/widgets/text_row.dart';

class AttributesColumn extends StatefulWidget {
  final List<Attribute> attributes;
  final List<AttributeValue> values;
  const AttributesColumn(
      {Key? key, required this.attributes, required this.values})
      : super(key: key);

  @override
  _AttributesColumnState createState() => _AttributesColumnState();
}

class _AttributesColumnState extends State<AttributesColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Attribute attribute in widget.attributes)
          TextRow(
              title: "${attribute.name}: ",
              value: widget
                  .values[widget.attributes
                      .indexWhere((element) => element == attribute)]
                  .name,
              titleStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              valueStyle: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              mainAxisAlignment: MainAxisAlignment.start),
      ],
    );
  }
}
