import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_e/errors/errors.dart';

class ProductErrors extends AppErrors<String> {
  ProductErrors(super.errorMessage, [super.errorParms]);

  factory ProductErrors.fromFirebase(FirebaseException e) {
    if (e.code == 'permission-denied') {
      return ProductErrors(
        'Permission denied, please contact support',
      );
    } else if (e.code == 'unavailable') {
      return ProductErrors(
        'Service unavailable, please try again later',
      );
    } else if (e.code == 'cancelled') {
      return ProductErrors(
        'Request cancelled, please try again later',
      );
    } else if (e.code == 'unknown') {
      return ProductErrors(
        'Unknown error, please try again later',
      );
    } else if (e.code == 'invalid-argument') {
      return ProductErrors(
        'Invalid argument, please try again later',
      );
    } else if (e.code == 'not-found') {
      return ProductErrors(
        'Product not found, please try again later',
      );
    } else if (e.code == 'already-exists') {
      return ProductErrors(
        'Product already exists, please try again later',
      );
    } else if (e.code == 'internal') {
      return ProductErrors(
        'Internal error, please try again later',
      );
    } else if (e.code == 'resource-exhausted') {
      return ProductErrors(
        'Resource exhausted, please try again later',
      );
    } else if (e.code == 'failed-precondition') {
      return ProductErrors(
        'Failed precondition, please try again later',
      );
    } else if (e.code == 'aborted') {
      return ProductErrors(
        'Request aborted, please try again later',
      );
    } else if (e.code == 'out-of-range') {
      return ProductErrors(
        'Out of range, please try again later',
      );
    } else {
      return ProductErrors(
        'An error occurred, please try again later',
      );
    }
  }
}
