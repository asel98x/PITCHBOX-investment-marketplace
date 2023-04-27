import 'PayHereAccountCredentials.dart';

class PayHerePayment {
  late Map<String, dynamic> paymentObjectOneTime;
  PayHerePayment({
    required String orderId,
    required String items,
    required String amount,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String country,
    required String deliveryAddress,
    required String deliveryCity,
    required String deliveryCountry,
    required String custom1,
    required String custom2,
  }) {
    paymentObjectOneTime = {
      "sandbox": true,
      "merchant_id": PayHereAccountCredentials().merchantId,
      "merchant_secret": PayHereAccountCredentials().merchantSecret,
      "notify_url": "http://sample.com/notify",
      "order_id": orderId,
      "items": items,
      "amount": amount,
      "currency": "LKR",
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "country": country,
      "delivery_address": deliveryAddress,
      "delivery_city": deliveryCity,
      "delivery_country": deliveryCountry,
      "custom_1": custom1,
      "custom_2": custom2,
    };
  }
}
