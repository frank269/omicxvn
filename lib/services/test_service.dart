import 'package:injectable/injectable.dart';

@injectable
class ServiceA {}

@injectable
class ServiceB {
  ServiceB(ServiceA serviceA);
}
