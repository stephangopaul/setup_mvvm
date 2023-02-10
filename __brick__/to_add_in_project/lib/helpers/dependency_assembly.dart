import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/services/api.dart';
import 'package:{{project_name}}/core/services/navigation_service.dart';
import 'package:{{project_name}}/core/viewmodels/home_vm.dart';

GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  dependencyAssembler.registerLazySingleton(() => NavigationService());
  dependencyAssembler.registerLazySingleton(() => API());
  dependencyAssembler.registerFactory(() => HomeVM());
}
