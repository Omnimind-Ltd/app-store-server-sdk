// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyReceiptResponse _$VerifyReceiptResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyReceiptResponse(
      status: json['status'] as int,
      environment: json['environment'] as String,
      isRetryable: json['is-retryable'] as bool?,
      receipt: json['receipt'] == null
          ? null
          : Receipt.fromJson(json['receipt'] as Map<String, dynamic>),
      latestReceiptInfo: (json['latest_receipt_info'] as List<dynamic>?)
          ?.map((e) => ReceiptInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestReceipt: json['latest_receipt'] as String?,
      pendingRenewalInfo: (json['pending_renewal_info'] as List<dynamic>?)
          ?.map((e) => PendingRenewalInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VerifyReceiptResponseToJson(
    VerifyReceiptResponse instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'environment': instance.environment,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is-retryable', instance.isRetryable);
  writeNotNull('receipt', instance.receipt);
  writeNotNull('latest_receipt_info', instance.latestReceiptInfo);
  writeNotNull('latest_receipt', instance.latestReceipt);
  writeNotNull('pending_renewal_info', instance.pendingRenewalInfo);
  return val;
}

Receipt _$ReceiptFromJson(Map<String, dynamic> json) => Receipt(
      receiptType: json['receipt_type'] as String?,
      adamId: json['adam_id'] as int?,
      appItemId: json['app_item_id'] as int?,
      bundleId: json['bundle_id'] as String?,
      applicationVersion: json['application_version'] as String?,
      downloadId: json['download_id'] as int?,
      versionExternalIdentifier: json['version_external_identifier'] as int?,
      receiptCreationDate: json['receipt_creation_date'] as String?,
      receiptCreationDateMs: json['receipt_creation_date_ms'] as String?,
      receiptCreationDatePst: json['receipt_creation_date_pst'] as String?,
      requestDate: json['request_date'] as String?,
      requestDateMs: json['request_date_ms'] as String?,
      requestDatePst: json['request_date_pst'] as String?,
      originalPurchaseDate: json['original_purchase_date'] as String?,
      originalPurchaseDateMs: json['original_purchase_date_ms'] as String?,
      originalPurchaseDatePst: json['original_purchase_date_pst'] as String?,
      originalApplicationVersion:
          json['original_application_version'] as String?,
      inApp: (json['in_app'] as List<dynamic>?)
          ?.map((e) => ReceiptInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('receipt_type', instance.receiptType);
  writeNotNull('adam_id', instance.adamId);
  writeNotNull('app_item_id', instance.appItemId);
  writeNotNull('bundle_id', instance.bundleId);
  writeNotNull('application_version', instance.applicationVersion);
  writeNotNull('download_id', instance.downloadId);
  writeNotNull(
      'version_external_identifier', instance.versionExternalIdentifier);
  writeNotNull('receipt_creation_date', instance.receiptCreationDate);
  writeNotNull('receipt_creation_date_ms', instance.receiptCreationDateMs);
  writeNotNull('receipt_creation_date_pst', instance.receiptCreationDatePst);
  writeNotNull('request_date', instance.requestDate);
  writeNotNull('request_date_ms', instance.requestDateMs);
  writeNotNull('request_date_pst', instance.requestDatePst);
  writeNotNull('original_purchase_date', instance.originalPurchaseDate);
  writeNotNull('original_purchase_date_ms', instance.originalPurchaseDateMs);
  writeNotNull('original_purchase_date_pst', instance.originalPurchaseDatePst);
  writeNotNull(
      'original_application_version', instance.originalApplicationVersion);
  writeNotNull('in_app', instance.inApp);
  return val;
}

ReceiptInfo _$ReceiptInfoFromJson(Map<String, dynamic> json) => ReceiptInfo(
      cancellationDate: json['cancellation_date'] as String?,
      cancellationDateMs: json['cancellation_date_ms'] as String?,
      cancellationDatePst: json['cancellation_date_pst'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      quantity: json['quantity'] as String?,
      productId: json['product_id'] as String?,
      transactionId: json['transaction_id'] as String?,
      originalTransactionId: json['original_transaction_id'] as String?,
      purchaseDate: json['purchase_date'] as String?,
      purchaseDateMs: json['purchase_date_ms'] as String?,
      purchaseDatePst: json['purchase_date_pst'] as String?,
      originalPurchaseDate: json['original_purchase_date'] as String?,
      originalPurchaseDateMs: json['original_purchase_date_ms'] as String?,
      originalPurchaseDatePst: json['original_purchase_date_pst'] as String?,
      expiresDate: json['expires_date'] as String?,
      expiresDateMs: json['expires_date_ms'] as String?,
      expiresDatePst: json['expires_date_pst'] as String?,
      webOrderLineItemId: json['web_order_line_item_id'] as String?,
      isTrialPeriod: json['is_trial_period'] as String?,
      isInIntroOfferPeriod: json['is_in_intro_offer_period'] as String?,
      inAppOwnershipType: json['in_app_ownership_type'] as String?,
      subscriptionGroupIdentifier:
          json['subscription_group_identifier'] as String?,
    );

Map<String, dynamic> _$ReceiptInfoToJson(ReceiptInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cancellation_date', instance.cancellationDate);
  writeNotNull('cancellation_date_ms', instance.cancellationDateMs);
  writeNotNull('cancellation_date_pst', instance.cancellationDatePst);
  writeNotNull('cancellation_reason', instance.cancellationReason);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('product_id', instance.productId);
  writeNotNull('transaction_id', instance.transactionId);
  writeNotNull('original_transaction_id', instance.originalTransactionId);
  writeNotNull('purchase_date', instance.purchaseDate);
  writeNotNull('purchase_date_ms', instance.purchaseDateMs);
  writeNotNull('purchase_date_pst', instance.purchaseDatePst);
  writeNotNull('original_purchase_date', instance.originalPurchaseDate);
  writeNotNull('original_purchase_date_ms', instance.originalPurchaseDateMs);
  writeNotNull('original_purchase_date_pst', instance.originalPurchaseDatePst);
  writeNotNull('expires_date', instance.expiresDate);
  writeNotNull('expires_date_ms', instance.expiresDateMs);
  writeNotNull('expires_date_pst', instance.expiresDatePst);
  writeNotNull('web_order_line_item_id', instance.webOrderLineItemId);
  writeNotNull('is_trial_period', instance.isTrialPeriod);
  writeNotNull('is_in_intro_offer_period', instance.isInIntroOfferPeriod);
  writeNotNull('in_app_ownership_type', instance.inAppOwnershipType);
  writeNotNull(
      'subscription_group_identifier', instance.subscriptionGroupIdentifier);
  return val;
}

PendingRenewalInfo _$PendingRenewalInfoFromJson(Map<String, dynamic> json) =>
    PendingRenewalInfo(
      expirationIntent: json['expiration_intent'] as String?,
      grace_period_expires_date: json['grace_period_expires_date'] as String?,
      grace_period_expires_date_ms:
          json['grace_period_expires_date_ms'] as String?,
      grace_period_expires_date_pst:
          json['grace_period_expires_date_pst'] as String?,
      autoRenewProductId: json['auto_renew_product_id'] as String?,
      isInBillingRetryPeriod: json['is_in_billing_retry_period'] as String?,
      offerCodeRefName: json['offer_code_ref_name'] as String?,
      productId: json['product_id'] as String?,
      originalTransactionId: json['original_transaction_id'] as String?,
      priceConsentStatus: json['price_consent_status'] as String?,
      promotional_offer_id: json['promotional_offer_id'] as String?,
      autoRenewStatus: json['auto_renew_status'] as String?,
    );

Map<String, dynamic> _$PendingRenewalInfoToJson(PendingRenewalInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expiration_intent', instance.expirationIntent);
  writeNotNull('grace_period_expires_date', instance.grace_period_expires_date);
  writeNotNull(
      'grace_period_expires_date_ms', instance.grace_period_expires_date_ms);
  writeNotNull(
      'grace_period_expires_date_pst', instance.grace_period_expires_date_pst);
  writeNotNull('auto_renew_product_id', instance.autoRenewProductId);
  writeNotNull('is_in_billing_retry_period', instance.isInBillingRetryPeriod);
  writeNotNull('offer_code_ref_name', instance.offerCodeRefName);
  writeNotNull('product_id', instance.productId);
  writeNotNull('original_transaction_id', instance.originalTransactionId);
  writeNotNull('price_consent_status', instance.priceConsentStatus);
  writeNotNull('promotional_offer_id', instance.promotional_offer_id);
  writeNotNull('auto_renew_status', instance.autoRenewStatus);
  return val;
}
