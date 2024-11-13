abstract class Failure {
  final String message;

  Failure({required this.message});
}

class CachFailure extends Failure {
  CachFailure({required super.message});
}
