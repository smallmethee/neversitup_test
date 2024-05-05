import 'package:dio/dio.dart';
import 'package:neversitup/shared/data/remote/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_network_service_provider.g.dart';

@riverpod
DioNetworkService networkService(NetworkServiceRef ref) {
  final Dio dio = Dio();
  return DioNetworkService(dio);
}
