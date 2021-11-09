/// The App Store Server API is a REST API that you call from your server to request and provide
/// information about your customers' in-app purchases. The App Store signs the transaction and
/// subscription renewal information that this API returns using the JSON Web Signature (JWS) specification.
/// App Store Server API is independent of the app’s installation status on the customer’s devices.
/// The App Store server returns information based on the customer’s in-app purchase history
/// regardless of whether the customer installed, removed, or reinstalled the app on their devices.
/// To request transaction and subscription status information with this API, provide any original
/// transaction identifier that belongs to the customer. The transaction history API responds with a
/// complete list of transactions, 20 at a time, starting with the oldest first. The subscription
/// status API returns the status for all of the customer’s subscriptions, organized by their subscription group identifier.
/// Use the Send Consumption Information endpoint to send information to the App Store when customers
/// request a refund for a consumable in-app purchase, after you receive the CONSUMPTION_REQUEST
/// App Store server notification. Your data helps inform refund decisions.
library app_store_server_sdk;

export 'src/app_store_server_api.dart';
export 'src/exception/api_exception.dart';
export 'src/io/app_store_server_http_client.dart';
export 'src/model/api_error.dart';
export 'src/model/consumption_request.dart';
export 'src/model/extend_renewal_date.dart';
export 'src/model/history_response.dart';
export 'src/model/order_lookup_response.dart';
export 'src/model/refund_lookup_response.dart';
export 'src/model/status_response.dart';
