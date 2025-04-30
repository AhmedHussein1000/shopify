# shopify

A Flutter e-commerce application with MVVM architecture pattern, built with BLoC for state management.

## Demo
[Watch Demo Video](https://drive.google.com/file/d/19NIJPxAGWL6wFkb0y1CJSf5QPAIUC-fK/view?usp=drive_link)

## Features
- User Authentication
- Product Browsing & Categories
- Favorites Management
- Shopping Cart
- Address Management
- Dark/Light Theme Support
- Multi-device Preview
- Responsive UI

## Screens
- Onboarding Screen
- Login/Register Screens
- Home Screen
- Product Details
- Categories Screen
- Favorites Screen
- Cart Screen
- Profile Screen
- Address Management
- Settings Screen

## Tech Stack
- Flutter - UI Framework
- Flutter BLoC - State Management
- Dio - API Client
- Dartz - Functional Programming
- Get_It - Dependency Injection
- Shared Preferences - Local Storage
- Device Preview - Multi-device Testing

## Project Structure
```bash
lib/
├── core/
│   ├── cache/
│   ├── di/
│   ├── errors/
│   ├── network/
│   └── repos/
│   ├── helpers/
│   ├── functions/
│   ├── routes/
│   ├── shared/
│   ├── themes/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── about_us/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── addresses/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── cart/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── categories/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── category_products/
│   │   ├── view_models/
│   │   └── views/
│   ├── change_password/
│   │   ├── view_models/
│   │   └── views/
│   ├── contact_us/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── faqs/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_model/
│   │   └── views/
│   ├── favorites/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── home/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── login/
│   │   ├── view_models/
│   │   └── views/
│   ├── main_layouts/
│   │   ├── view_models/
│   │   └── views/
│   ├── onboarding/
│   │   ├── view_models/
│   │   └── views/
│   ├── product_details/
│   │   ├── view_models/
│   │   └── views/
│   ├── profile/
│   │   ├── models/
│   │   ├── repository/
│   │   ├── view_models/
│   │   └── views/
│   ├── search/
│   │   ├── view_models/
│   │   └── views/
│   ├── settings/
│   │   ├── models/
│   │   ├── view_models/
│   │   └── views/
│   └── signup/
│       ├── view_models/
│       └── views/
└── main.dart
 
