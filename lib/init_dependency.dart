import 'package:get_it/get_it.dart';
import 'package:posts_all/feature/detail/bloc/bloc_details_bloc.dart';
import 'call_net/network_call/call.dart';
import 'call_net/network_call/call_source.dart';
import 'call_net/network_call_impl/call_data_source.dart';
import 'feature/home/bloc/bloc_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initD();
}

void _initD() {
  serviceLocator
    ..registerFactory<NetworkMethodsCall>(() => NetworkCallSource())
    ..registerFactory<NetworkDataSource>(() => NetworkImpl(serviceLocator()))
    ..registerLazySingleton(() => BlocPost(serviceLocator()))
    ..registerLazySingleton(() => BlocDetails(serviceLocator()));
}

