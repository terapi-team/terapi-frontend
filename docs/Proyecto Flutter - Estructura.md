═════════════════════════════════════════════
# PROYECTO FLUTTER - ESTRUCTURA
═════════════════════════════════════════════

terapi-frontend/
│
├── android/
│
├── assets/
|   |
│   ├── icons/
│   |   ├── book-open.svg
│   |   ├── brain.svg
│   |   ├── (Muchos archivos .svg)
│   |   └── wallet.svg
│   |
│   ├── images/
|   |
│   └── jsons/
│
├── docs/
|   |
│   ├── imgs/
│   │   ├── Mockups/
│   │   ├── Diagrama de Casos de Uso.png
│   │   ├── Diagrama de Clases.png
│   │   └── Diagrama de Despliegue.png 
|   |
│   ├── Diagrama de Casos de uso.puml
│   ├── Diagrama de Clases.puml
│   ├── Diagrama de Despliegue.puml
│   └── Proyecto Flutter - Estructura.md
│
├── ios/
│
├── lib/
|   |
│   ├── components/
│   │   ├── app_navigation.dart
│   │   ├── bottom_nav_bar.dart
│   │   ├── main_app_bar.dart
│   │   ├── nav_bar.dart
│   │   └── setting_app_bar.dart
|   |
│   ├── configs/
|   |
│   ├── models/
│   │   └── entities/
|   |
│   ├── pages/
|   |   |
│   │   ├── patient/ (Nuevo ✅)
|   |   |   |
|   │   │   ├── add_payment_card/
|   │   │   |   ├── add_payment_card_controller.dart
|   |   |   |   └── add_payment_card_page.dart
|   |   |   |
|   │   │   ├── appointment_details/
|   │   │   |   ├── appointment_details_controller.dart
|   |   |   |   └── appointment_details_page.dart
|   |   |   |
|   │   │   ├── appointment_schedules_selection/
|   │   │   |   ├── appointment_schedules_selection_controller.dart
|   |   |   |   └── appointment_schedules_selection_page.dart
|   |   |   |
|   │   │   ├── appointments/
|   │   │   |   ├── appointments_controller.dart
|   |   |   |   └── appointments_page.dart
|   |   |   |
|   │   │   ├── change_password/
|   │   │   |   ├── change_password_controller.dart
|   |   |   |   └── change_password_page.dart
|   |   |   |
|   │   │   ├── edit_personal_info/
|   │   │   |   ├── edit_personal_info_controller.dart
|   |   |   |   └── edit_personal_info_page.dart
|   |   |   |
|   │   │   ├── help_center/
│   |   │   |   ├── help_center_controller.dart
|   |   |   |   └── help_center_page.dart
|   |   |   |
|   │   │   ├── home_search_appointments/
│   │   |   |   ├── home_search_appointments_controller.dart
|   |   |   |   └── home_search_appointments_page.dart
|   |   |   |
|   │   │   ├── payment_methods/
│   │   |   |   ├── payment_methods_controller.dart
|   |   |   |   └── payment_methods_page.dart
|   |   |   |
|   │   │   ├── schedule_appointment/
│   |   │   |   ├── schedule_appointment_controller.dart
|   |   |   |   └── schedule_appointment_page.dart
|   |   |   |
|   │   │   ├── search_appointment_filters/
|   │   │   |   ├── search_appointment_filters_controller.dart
|   |   |   |   └── search_appointment_filters_page.dart
|   |   |   |
|   │   │   ├── search_appointment_therapist/
│   │   |   |   ├── search_appointment_therapist_controller.dart
|   |   |   |   └── search_appointment_therapist_page.dart
|   |   |   |
|   │   │   ├── terms_and_conditions/
│   |   │   |   ├── terms_and_conditions_controller.dart
|   |   |   |   └── terms_and_conditions_page.dart
|   |   |   |
|   │   │   ├── therapist_profile_opinions/
│   │   |   |   ├── therapist_profile_opinions_controller.dart
|   |   |   |   └── therapist_profile_opinions_page.dart
|   |   |   |
|   │   │   ├── chat.dart
│   │   |   └── profile.dart
|   |   |
|   │   ├── therapist/ (Nuevo ✅)
|   |   |
│   │   └── admin/ (Nuevo ✅)
|   |
│   ├── screens/
│   │   └── settings.dart
|   |
│   ├── services/
|   |
│   └── main.dart
│
├── linux/
│
├── macos/
│
├── test/
│
├── web/
|
├── windows/
|
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md
