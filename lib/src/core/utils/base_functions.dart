part of 'utils.dart';

final String defaultSystemLocale = Platform.localeName.split('_').first;

String get defaultLocale => switch (defaultSystemLocale) {
      'ru' => 'ru',
      'en' => 'en',
      'uz' => 'uz',
      _ => 'ru',
    };

String get defaultTheme =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

String phoneFormat(String phone) {
  if (phone.length >= 13) {
    String t = phone;
    t = t.replaceAll('+998', '');
    t = '${t.substring(0, 2)} ${t.substring(2, 5)} ${t.substring(5, 7)} ${t.substring(7, 9)}';
    return '+998 $t';
  } else {
    return phone;
  }
}

OrderStatus getDeliveryStatus(String? statusId) {
  switch (statusId) {
    case Constants.newId:
      return OrderStatus.newStatus;

    case Constants.operatorAccepted:
      return OrderStatus.operatorAccepted;
    case Constants.courierAccepted:
      return OrderStatus.vendorAccepted;

    case Constants.vendorAccepted:
      return OrderStatus.vendorReady;
    case Constants.vendorReady:
      return OrderStatus.vendorReady;

    case Constants.courierPickedUp:
      return OrderStatus.courierPickUp;

    case Constants.finished:
      return OrderStatus.finished;

    case Constants.serverCancelled:
      return OrderStatus.serverCancelled;

    case Constants.operatorCancelled:
      return OrderStatus.operatorCancelled;

    case Constants.delivered:
      return OrderStatus.delivered;

    case Constants.futureTime:
      return OrderStatus.futureTime;

    default:
      {
        return OrderStatus.newStatus;
      }
  }
}

String getDeliveryText(String statusId) {
  var status = getDeliveryStatus(statusId);
  switch (status) {
    case OrderStatus.newStatus:
      {
        return 'order_processed'.tr;
      }
    case OrderStatus.vendorReady:
      {
        return 'branch_accepted'.tr;
      }
    case OrderStatus.courierPickUp:
      {
        return 'courier_took'.tr;
      }
    case OrderStatus.finished:
      {
        return 'finished_order'.tr;
      }
    case OrderStatus.delivered:
      {
        return 'delivered'.tr;
      }
    case OrderStatus.serverCancelled:
      {
        return 'server_cancelled'.tr;
      }
    case OrderStatus.operatorCancelled:
      {
        return 'operator_cancelled'.tr;
      }
    case OrderStatus.futureTime:
      {
        return 'future_time'.tr;
      }
    default:
      {
        return 'order_processed'.tr;
      }
  }
}

OrderStatus getSelfPickUpStatus(String? statusId) {
  switch (statusId) {
    case Constants.newId:
      return OrderStatus.newStatus;

    case Constants.operatorAccepted:
      return OrderStatus.vendorAccepted;

    case Constants.vendorAccepted:
      return OrderStatus.vendorAccepted;

    case Constants.vendorReady:
      return OrderStatus.vendorReady;

    case Constants.finished:
      return OrderStatus.finished;
    case Constants.serverCancelled:
      return OrderStatus.serverCancelled;
    case Constants.operatorCancelled:
      return OrderStatus.operatorCancelled;
    case Constants.delivered:
      return OrderStatus.delivered;
    case Constants.futureTime:
      return OrderStatus.futureTime;
    default:
      {
        return OrderStatus.newStatus;
      }
  }
}

String getSelfPickUpText(String statusId) {
  var status = getSelfPickUpStatus(statusId);
  switch (status) {
    case OrderStatus.newStatus:
      {
        return 'order_processed'.tr;
      }
    case OrderStatus.vendorReady:
      {
        return 'branch_accepted'.tr;
      }
    case OrderStatus.finished:
      {
        return 'finished_order'.tr;
      }
    case OrderStatus.delivered:
      {
        return 'delivered'.tr;
      }
    case OrderStatus.serverCancelled:
      {
        return 'server_cancelled'.tr;
      }
    case OrderStatus.operatorCancelled:
      {
        return 'operator_cancelled'.tr;
      }
    case OrderStatus.futureTime:
      {
        return 'future_time'.tr;
      }
    default:
      {
        return 'order_processed'.tr;
      }
  }
}

enum OrderStatus {
  newStatus,
  vendorAccepted,
  vendorReady,
  courierPickUp,
  finished,
  delivered,
  serverCancelled,
  operatorCancelled,
  futureTime,
  operatorAccepted,
}
