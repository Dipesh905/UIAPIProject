import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ActivityTransactionStatus {
  activity,

  transaction
}

final StateProvider<ActivityTransactionStatus>
    activityTransactionStatusProvider =
    StateProvider<ActivityTransactionStatus>(
  (StateProviderRef<ActivityTransactionStatus> ref) =>
      ActivityTransactionStatus.activity,
);
