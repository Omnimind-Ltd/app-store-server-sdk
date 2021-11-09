// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsumptionRequest _$ConsumptionRequestFromJson(Map<String, dynamic> json) =>
    ConsumptionRequest(
      accountTenure: json['accountTenure'] as int?,
      appAccountToken: json['appAccountToken'] as String?,
      consumptionStatus: json['consumptionStatus'] as int?,
      customerConsented: json['customerConsented'] as bool?,
      deliveryStatus: json['deliveryStatus'] as int?,
      lifetimeDollarsPurchased: json['lifetimeDollarsPurchased'] as int?,
      lifetimeDollarsRefunded: json['lifetimeDollarsRefunded'] as int?,
      platform: json['platform'] as int?,
      playTime: json['playTime'] as int?,
      sampleContentProvided: json['sampleContentProvided'] as bool?,
      userStatus: json['userStatus'] as int?,
    );

Map<String, dynamic> _$ConsumptionRequestToJson(ConsumptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountTenure', instance.accountTenure);
  writeNotNull('appAccountToken', instance.appAccountToken);
  writeNotNull('consumptionStatus', instance.consumptionStatus);
  writeNotNull('customerConsented', instance.customerConsented);
  writeNotNull('deliveryStatus', instance.deliveryStatus);
  writeNotNull('lifetimeDollarsPurchased', instance.lifetimeDollarsPurchased);
  writeNotNull('lifetimeDollarsRefunded', instance.lifetimeDollarsRefunded);
  writeNotNull('platform', instance.platform);
  writeNotNull('playTime', instance.playTime);
  writeNotNull('sampleContentProvided', instance.sampleContentProvided);
  writeNotNull('userStatus', instance.userStatus);
  return val;
}
