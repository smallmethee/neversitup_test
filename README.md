# neversitup

# Project Structure Overview

# `lib/`

### `app/`

- `my_app.dart`: วิดเจ็ตแอปพลิเคชันหลักที่เริ่มแอป
- `observers.dart`: ติดตามการเปลี่ยนแปลงในผู้ให้บริการ Riverpod

### `configs/`

รวมไฟล์การกำหนดค่าที่กำหนดการตั้งค่าทั่วทั้งแอป

- `app_configs.dart`: มีการตั้งค่าการกำหนดค่า เช่น url API, คีย์ ฯลฯ
- `globals.dart`: กำหนดตัวแปรส่วนกลางและการตั้งค่าที่ใช้ในแอป

### `features/`

ประกอบด้วยไดเร็กทอรีย่อยเฉพาะคุณลักษณะทั้งหมด หนึ่งรายการต่อคุณลักษณะ

#### `dashboard/`

ฟังก์ชันเฉพาะที่เกี่ยวข้องกับคุณลักษณะแดชบอร์ด

##### `data/`

จัดการการดึงข้อมูลและการจัดการ

- `datasource/`
  - `dashboard_remote_datasource.dart`: จัดการการดำเนินการข้อมูล เช่น ดึงข้อมูลจาก api
- `repositories/`
  - `dashboard_repository.dart`: พื้นที่เก็บข้อมูลสำหรับการสรุปชั้นข้อมูล

##### `domain/`

Includes business logic and provider definitions.

- `providers/`
  - `dashboard_providers.dart`: ประกาศผู้ให้บริการ Riverpod ที่ใช้ภายในแดชบอร์ด
- `repositories/`
  - `dashboard_repository.dart`: อินเทอร์เฟซสำหรับการเข้าถึงแหล่งข้อมูล

##### `presentation/`

Manages UI and state management specific to the dashboard.

- `providers/`
  - `dashboard_state_provider.dart`: การจัดการสถานะสำหรับส่วนประกอบแดชบอร์ด
- `screens/`
  - `dashboard_screen.dart`: หน้าจอหลักสำหรับคุณสมบัติแดชบอร์ด
- `widgets/`
  - `department_tile.dart`: Widget representing a department.
  - `product_card.dart`: Widget displaying a product's details.

### `shared/`

ส่วนประกอบและยูทิลิตี้ที่ใช้ในคุณสมบัติต่างๆ ของแอปพลิเคชัน

#### `data/`

Common data handling layers.

- `remote/`
  - `dio_network_service.dart`: Dio based network service for HTTP requests.
  - `network_service.dart`: Abstract definition of network services.
  - `network.dart`: Utility functions for network connectivity.

#### `domain/`

Shared domain models and business logic.

- `models/`

  - `departments/`
    - `department_model.dart`: Data model for department.
  - `products/`
    - `product_by_department_id_model.dart`: Data model for products filtered by department.
  - `either.dart`: Utility for handling either type in functional programming.
  - `response.dart`: Defines standard response structure.

- `providers/`
  - `dio_network_service_provider.dart`: Provider for network services using Dio.

#### `exceptions/`

- `http_exception.dart`: Defines custom HTTP exceptions.

#### `extensions/`

- `cache.dart`: Extensions for caching mechanisms.

#### `mixins/`

- `exception_handler_mixin.dart`: Mixin for handling exceptions in a standardized way.

#### `theme/`

- `theme.dart`: Defines the global theme data for the app.

#### `widgets/`

General reusable widgets across the app.

- `widget.dart`: Commonly used widgets.

# `test/`

เก็บเทสต่าง ๆ เคชตามรูปแบบของ โฟรเดอร์ lib
