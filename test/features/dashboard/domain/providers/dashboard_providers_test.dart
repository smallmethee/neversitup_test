import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neversitup/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:neversitup/features/dashboard/data/repositories/dashboard_repository.dart';
import 'package:neversitup/features/dashboard/domain/providers/dashboard_providers.dart';
import 'package:neversitup/shared/data/remote/dio_network_service.dart';
import 'package:neversitup/shared/domain/providers/dio_network_service_provider.dart';

class MockDioNetworkService extends Mock implements DioNetworkService {}

void main() {
  group('Dashboard Providers', () {
    late ProviderContainer container;
    late MockDioNetworkService mockDioNetworkService;

    setUp(() {
      mockDioNetworkService = MockDioNetworkService();
      container = ProviderContainer(overrides: [
        networkServiceProvider.overrideWithValue(mockDioNetworkService),
      ]);
    });

    tearDown(() {
      container.dispose();
    });

    test('dashboardDatasource should create a DashboardRemoteDatasource', () {
      final datasource =
          container.read(dashboardDatasourceProvider(mockDioNetworkService));

      expect(datasource, isA<DashboardRemoteDatasource>());
    });

    test('dashboardRepository should create a DashboardRepositoryImpl', () {
      final repository = container.read(dashboardRepositoryProvider);

      expect(repository, isA<DashboardRepositoryImpl>());
    });
  });
}
