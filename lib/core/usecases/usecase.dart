import 'package:weathque/features/app/domain/entities/parameters.dart';

abstract class UseCase<Type, Params extends Parameters>{
  Future<Type> call({required Params params});
}