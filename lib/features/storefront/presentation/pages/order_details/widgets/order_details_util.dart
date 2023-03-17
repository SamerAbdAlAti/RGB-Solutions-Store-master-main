import 'package:beamer/beamer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/types/order_status.dart';
import 'package:saleor_app_flutter/core/types/payment_charge_status_enum.dart';

class OrderDetailsUtil {
  String getDate(String dateTime) {
    DateTime time = DateTime.parse(dateTime);
    return "${time.day}-${time.month}-${time.year}";
  }

  String getDateAndTime(String dateTime) {
    DateTime time = DateTime.parse(dateTime);
    return "${time.day}-${time.month}-${time.year} ${time.hour}:${time.minute}";
  }

  Tuple3<String, Color, Color?> getStatus(BuildContext context,
      OrderStatus orderStatus, PaymentChargeStatusEnum paymentStatus) {
    Color color = StoreTheme.breakerColor;
    Color? textColor;
    String orderStatusText = '';
    if (orderStatus == OrderStatus.FULFILLED &&
        paymentStatus == PaymentChargeStatusEnum.FULLY_CHARGED) {
      orderStatusText = "تم إيصال الطلب";
      color = StoreTheme.breakerColor;
      textColor = Colors.white;
    }

    if (orderStatus == OrderStatus.UNFULFILLED &&
        paymentStatus == PaymentChargeStatusEnum.NOT_CHARGED) {
      orderStatusText = "تم وضع الطلب";
      color = const Color.fromARGB(255, 42, 128, 68);
      textColor = Colors.white;
    }

    if (orderStatus == OrderStatus.FULFILLED &&
        paymentStatus == PaymentChargeStatusEnum.NOT_CHARGED) {
      orderStatusText = "في الطريق";
      color = StoreTheme.tentColor;
      textColor = Colors.white;
    }

    if (orderStatus == OrderStatus.CANCELED) {
      orderStatusText = "ملغي";
      color = const Color.fromARGB(255, 238, 120, 120);
      textColor = Colors.white;
    }

    if (orderStatus == OrderStatus.RETURNED) {
      orderStatusText = "مسترجع";
      color = const Color.fromARGB(255, 233, 141, 141);
      textColor = null;
    }

    if (paymentStatus == PaymentChargeStatusEnum.FULLY_REFUNDED) {
      orderStatusText = "مسترجع دون السلعة";
      color = const Color.fromARGB(255, 233, 141, 141);
      textColor = null;
    }

    if (orderStatus == OrderStatus.RETURNED &&
        paymentStatus == PaymentChargeStatusEnum.FULLY_REFUNDED) {
      orderStatusText = "مسترجع";
      color = const Color.fromARGB(255, 78, 158, 102);
      textColor = Colors.white;
    }

    if (paymentStatus == PaymentChargeStatusEnum.FULLY_REFUNDED) {
      orderStatusText = "مسترجع دون السلعة";
      color = const Color.fromARGB(255, 233, 141, 141);
      textColor = null;
    }
    return tuple3(orderStatusText, color, textColor);
  }

  Widget directToAccount(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Beamer.of(context).beamToReplacementNamed('/account');
    });
    return Container();
  }
}
