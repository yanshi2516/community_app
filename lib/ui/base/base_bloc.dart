import 'package:rxdart/rxdart.dart';

class BaseBloc {
  final subscription = CompositeSubscription();

  void dispose() {
    subscription.clear();
  }
}