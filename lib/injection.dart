import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tp_twitter/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

const String currentEnvironment = 'mock'; // or 'api'

T GetAppService<T extends Object>() {
  return GetIt.instance<T>(instanceName: currentEnvironment);
}
