# neversitup

# Project Structure Overview

# `lib/`

### `app/`

- [`my_app.dart`](lib/app/my_app.dart): วิดเจ็ตแอปพลิเคชันหลักที่เริ่มแอป
- [`observers.dart`](lib/app/observers.dart): ติดตามการเปลี่ยนแปลงในผู้ให้บริการ Riverpod

### [`configs/`](lib/configs)

รวมไฟล์การกำหนดค่าที่กำหนดการตั้งค่าทั่วทั้งแอป

- [`app_configs.dart`](lib/configs/app_configs.dart): มีการตั้งค่าการกำหนดค่า เช่น url API, คีย์ ฯลฯ
- [`globals.dart`](lib/configs/globals.dart): กำหนดตัวแปรส่วนกลางและการตั้งค่าที่ใช้ในแอป

### [`features/`](lib/features)

ประกอบด้วยไดเร็กทอรีย่อยเฉพาะคุณลักษณะทั้งหมด หนึ่งรายการต่อคุณลักษณะ

#### [`dashboard/`](lib/features/dashboard)

ฟังก์ชันเฉพาะที่เกี่ยวข้องกับคุณลักษณะแดชบอร์ด

##### [`data/`](lib/features/dashboard/data)

จัดการการดึงข้อมูลและการจัดการ

- [`datasource/`](lib/features/dashboard/data/datasource)
  - [`dashboard_remote_datasource.dart`](lib/features/dashboard/data/datasource/dashboard_remote_datasource.dart): จัดการการดำเนินการข้อมูล เช่น ดึงข้อมูลจาก api
- [`repositories/`](lib/features/dashboard/data/repositories)
  - [`dashboard_repository.dart`](lib/features/dashboard/data/repositories/dashboard_repository.dart): พื้นที่เก็บข้อมูลสำหรับการสรุปชั้นข้อมูล

##### [`domain/`](lib/features/dashboard/domain)

Includes business logic and provider definitions.

- [`providers/`](lib/features/dashboard/domain/providers)
  - [`dashboard_providers.dart`](lib/features/dashboard/domain/providers/dashboard_providers.dart): ประกาศผู้ให้บริการ Riverpod ที่ใช้ภายในแดชบอร์ด
- [`repositories/`](lib/features/dashboard/domain/repositories)
  - [`dashboard_repository.dart`](lib/features/dashboard/domain/repositories/dashboard_repository.dart): อินเทอร์เฟซสำหรับการเข้าถึงแหล่งข้อมูล

##### [`presentation/`](lib/features/dashboard/presentation)

Manages UI and state management specific to the dashboard.

- [`providers/`](lib/features/dashboard/presentation/providers)
  - [`dashboard_state_provider.dart`](lib/features/dashboard/presentation/providers/dashboard_state_provider.dart): การจัดการสถานะสำหรับส่วนประกอบแดชบอร์ด
- [`screens/`](lib/features/dashboard/presentation/screens)
  - [`dashboard_screen.dart`](lib/features/dashboard/presentation/screens/dashboard_screen.dart): หน้าจอหลักสำหรับคุณสมบัติแดชบอร์ด
- [`widgets/`](lib/features/dashboard/presentation/widgets)
  - [`department_tile.dart`](lib/features/dashboard/presentation/widgets/department_tile.dart): Widget representing a department.
  - [`product_card.dart`](lib/features/dashboard/presentation/widgets/product_card.dart): Widget displaying a product's details.

### [`shared/`](lib/shared)

ส่วนประกอบและยูทิลิตี้ที่ใช้ในคุณสมบัติต่างๆ ของแอปพลิเคชัน

#### [`data/`](lib/shared/data)

Common data handling layers.

- [`remote/`](lib/shared/data/remote)
  - [`dio_network_service.dart`](lib/shared/data/remote/dio_network_service.dart): Dio based network service for HTTP requests.
  - [`network_service.dart`](lib/shared/data/remote/network_service.dart): Abstract definition of network services.
  - [`network.dart`](lib/shared/data/remote/network.dart): Utility functions for network connectivity.

#### [`domain/`](lib/shared/domain)

Shared domain models and business logic.

- [`models/`](lib/shared/domain/models)

  - [`departments/`](lib/shared/domain/models/departments)
    - [`department_model.dart`](lib/shared/domain/models/departments/department_model.dart): Data model for department.
  - [`products/`](lib/shared/domain/models/products)
    - [`product_by_department_id_model.dart`](lib/shared/domain/models/products/product_by_department_id_model.dart): Data model for products filtered by department.
  - [`either.dart`](lib/shared/domain/models/either.dart): Utility for handling either type in functional programming.
  - [`response.dart`](lib/shared/domain/models/response.dart): Defines standard response structure.

- [`providers/`](lib/shared/domain/providers)
  - [`dio_network_service_provider.dart`](lib/shared/domain/providers/dio_network_service_provider.dart): Provider for network services using Dio.

#### [`exceptions/`](lib/shared/exceptions)

- [`http_exception.dart`](lib/shared/exceptions/http_exception.dart): Defines custom HTTP exceptions.

#### (`extensions/`)(lib/shared/extensions)

- [`cache.dart`](lib/shared/extensions/cache.dart): Extensions for caching mechanisms.

#### [`mixins/`](lib/shared/mixins)

- [`exception_handler_mixin.dart`](lib/shared/mixins/exception_handler_mixin.dart): Mixin for handling exceptions in a standardized way.

#### `widgets/`

General reusable widgets across the app.

- `widget.dart`: Commonly used widgets.

# [`test/`](test)

เก็บเทสต่าง ๆ เคชตามรูปแบบของ โฟรเดอร์ lib
