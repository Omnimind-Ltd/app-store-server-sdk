// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_renewal_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendRenewalDateRequest _$ExtendRenewalDateRequestFromJson(
        Map<String, dynamic> json) =>
    ExtendRenewalDateRequest(
      extendByDays: json['extendByDays'] as int,
      extendReasonCode: json['extendReasonCode'] as int,
      requestIdentifier: json['requestIdentifier'] as String,
    );

Map<String, dynamic> _$ExtendRenewalDateRequestToJson(
        ExtendRenewalDateRequest instance) =>
    <String, dynamic>{
      'extendByDays': instance.extendByDays,
      'extendReasonCode': instance.extendReasonCode,
      'requestIdentifier': instance.requestIdentifier,
    };

ExtendRenewalDateResponse _$ExtendRenewalDateResponseFromJson(
        Map<String, dynamic> json) =>
    ExtendRenewalDateResponse(
      json['effectiveDate'] as String,
      json['originalTransactionId'] as String,
      json['success'] as bool,
      json['webOrderLineItemId'] as String,
    );

Map<String, dynamic> _$ExtendRenewalDateResponseToJson(
        ExtendRenewalDateResponse instance) =>
    <String, dynamic>{
      'effectiveDate': instance.effectiveDate,
      'originalTransactionId': instance.originalTransactionId,
      'success': instance.success,
      'webOrderLineItemId': instance.webOrderLineItemId,
    };
