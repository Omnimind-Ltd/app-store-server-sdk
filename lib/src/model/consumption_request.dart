import 'package:json_annotation/json_annotation.dart';

part 'consumption_request.g.dart';

/// The request body containing consumption information.
@JsonSerializable()
class ConsumptionRequest {
  /// The age of the customer’s account.
  ///
  /// Possible Values:
  /// 0 - Account age is undeclared.
  /// 1 - Account age is between 0–3 days.
  /// 2 - Account age is between 3–10 days.
  /// 3 - Account age is between 10–30 days.
  /// 4 - Account age is between 30–90 days.
  /// 5 - Account age is between 90–180 days.
  /// 6 - Account age is between 180–365 days.
  /// 7 - Account age is over 365 days.
  final int? accountTenure;

  /// The UUID an app optionally generates to map a customer’s in-app purchase with its resulting App Store transaction.
  final String? appAccountToken;

  /// A value that indicates the extent to which the customer consumed the in-app purchase.
  ///
  /// Possible Values:
  /// 0 - The consumption status is undeclared.
  /// 1 - The in-app purchase is not consumed.
  /// 2 - The in-app purchase is partially consumed.
  /// 3 - The in-app purchase is fully consumed.
  final int? consumptionStatus;

  /// A Boolean value that indicates whether the customer consented to provide consumption data to the App Store.
  final bool? customerConsented;

  /// A value that indicates whether the app successfully delivered an in-app purchase that works properly.
  ///
  /// Possible Values:
  /// 0 - The app delivered the consumable in-app purchase and it’s working properly.
  /// 1 - The app didn’t deliver the consumable in-app purchase due to a quality issue.
  /// 2 - The app delivered the wrong item.
  /// 3 - The app didn’t deliver the consumable in-app purchase due to a server outage.
  /// 4 - The app didn’t deliver the consumable in-app purchase due to an in-game currency change.
  /// 5 - The app didn’t deliver the consumable in-app purchase for other reasons.
  final int? deliveryStatus;

  /// A value that indicates the dollar amount of in-app purchases the customer has made in your app, since purchasing the app, across all platforms.
  ///
  /// Possible Values:
  /// 0 - Lifetime purchase amount is undeclared.
  /// 1 - Lifetime purchase amount is 0 USD.
  /// 2 - Lifetime purchase amount is between 0.01–49.99 USD.
  /// 3 - Lifetime purchase amount is between 50–99.99 USD.
  /// 4 - Lifetime purchase amount is between 100–499.99 USD.
  /// 5 - Lifetime purchase amount is between 500–999.99 USD.
  /// 6 - Lifetime purchase amount is between 1000–1999.99 USD.
  /// 7 - Lifetime purchase amount is over 2000 USD.
  final int? lifetimeDollarsPurchased;

  /// A value that indicates the dollar amount of refunds the customer has received in your app, since purchasing the app, across all platforms.
  ///
  /// Possible Values:
  /// 0 - Lifetime refund amount is undeclared.
  /// 1 - Lifetime refund amount is 0 USD.
  /// 2 - Lifetime refund amount is between 0.01–49.99 USD.
  /// 3 - Lifetime refund amount is between 50–99.99 USD.
  /// 4 - Lifetime refund amount is between 100–499.99 USD.
  /// 5 - Lifetime refund amount is between 500–999.99 USD.
  /// 6 - Lifetime refund amount is between 1000–1999.99 USD.
  /// 7 - Lifetime refund amount is over 2000 USD.
  final int? lifetimeDollarsRefunded;

  /// The platform on which the customer consumed the in-app purchase.
  ///
  /// Possible Values:
  /// 0 - Undeclared
  /// 1 - An Apple platform.
  /// 2 - Non-Apple platform.
  final int? platform;

  /// A value that indicates the amount of time that the customer used the app.
  ///
  /// Possible Values:
  /// 0 - The engagement time is undeclared.
  /// 1 - The engagement time is between 0–5 minutes.
  /// 2 - The engagement time is between 5–60 minutes.
  /// 3 - The engagement time is between 1–6 hours.
  /// 4 - The engagement time is between 6–24 hours.
  /// 5 - The engagement time is between 1–4 days.
  /// 6 - The engagement time is between 4–16 days.
  /// 7 - The engagement time is over 16 days.
  final int? playTime;

  /// A Boolean value that indicates whether you provided, prior to its purchase, a free sample or trial of the content, or information about its functionality.
  final bool? sampleContentProvided;

  /// The status of a customer’s account within your app.
  ///
  /// Possible Values:
  /// 0 - Account status is undeclared.
  /// 1 - The customer’s account is active.
  /// 2 - The customer’s account is suspended.
  /// 3 - The customer’s account is terminated.
  /// 4 - The customer’s account has limited access.
  final int? userStatus;

  const ConsumptionRequest(
      {this.accountTenure,
      this.appAccountToken,
      this.consumptionStatus,
      this.customerConsented,
      this.deliveryStatus,
      this.lifetimeDollarsPurchased,
      this.lifetimeDollarsRefunded,
      this.platform,
      this.playTime,
      this.sampleContentProvided,
      this.userStatus});

  Map<String, dynamic> toJson() => _$ConsumptionRequestToJson(this);

  factory ConsumptionRequest.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionRequestFromJson(json);

  @override
  String toString() {
    return 'ConsumptionRequest{accountTenure: $accountTenure, '
        'appAccountToken: $appAccountToken, '
        'consumptionStatus: $consumptionStatus, '
        'customerConsented: $customerConsented, '
        'deliveryStatus: $deliveryStatus, '
        'lifetimeDollarsPurchased: $lifetimeDollarsPurchased, '
        'lifetimeDollarsRefunded: $lifetimeDollarsRefunded, '
        'platform: $platform, playTime: $playTime, '
        'sampleContentProvided: $sampleContentProvided, '
        'userStatus: $userStatus}';
  }
}
