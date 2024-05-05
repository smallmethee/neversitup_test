import 'package:neversitup/shared/data/remote/network_service.dart';
import 'package:neversitup/shared/domain/providers/dio_network_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasource/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../repositories/dashboard_repository.dart';

part 'dashboard_providers.g.dart';

@riverpod
DashboardDatasource dashboardDatasource(
    DashboardDatasourceRef ref, NetworkService networkService) {
  return DashboardRemoteDatasource(networkService);
}

@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(dashboardDatasourceProvider(networkService));
  final repository = DashboardRepositoryImpl(datasource);

  return repository;
}
