### 🔹 Clean Architecture (Advanced Implementation)

#### 📦 Domain Layer

- Contains pure business logic
- No dependency on Flutter or external libraries

Includes:
- Entities (Product)
- Repository Contracts
- UseCases (GetProducts)

---

#### 💾 Data Layer

- Handles API & data conversion
- Converts JSON → Model → Entity

Components:
- Models (ProductModel)
- Remote Data Source (API calls using Dio)
- Repository Implementation

---

#### 🎯 Presentation Layer

- UI + State Management (Cubit/Bloc)
- Listens to state changes and updates UI

---

#### 🧪 Error Handling

- Centralized error handling
- Custom failure classes
- API exceptions handled gracefully


### 🔹 Animations
- Implicit Animations:
  - AnimatedContainer
  - AnimatedOpacity
- Explicit Animations:
  - AnimationController
  - Tween & CurvedAnimation
- Hero Animation (Screen transitions)

---

### 🔹 Multi-language Support (Localization)
- Internationalization (i18n)
- Supporting multiple languages
- RTL (Right-to-Left) & LTR (Left-to-Right) layouts
- Localization using Flutter intl package

---

### 🔹 Native Bridge (Platform Channels)
- Communication between Flutter & Native (Android/iOS)
- Using MethodChannel
- Calling native APIs (e.g., battery, sensors)
- Handling platform-specific features

---

### 🔹 Testing (Unit Testing)
- Writing unit tests for business logic
- Widget tests and Integration tests 
- Testing UseCases & Repository layer
- Mocking dependencies



