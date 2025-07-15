# Modular SwiftUI App with SwiftData

This repository accompanies the blog post:

**["Decoupling SwiftData from SwiftUI: Building Modular and Scalable Apps"](https://swiftorbit.io/decoupling-swiftdata-swiftui-clean-architecture/)**

The project demonstrates clearly defined boundaries between SwiftData persistence logic, ViewModel, and SwiftUI views by applying Clean Architecture and SOLID principles.

## 🧩 Project Modules

| Module                    | Responsibility                                  |
|---------------------------|-------------------------------------------------|
| **SwiftDataApp**          | Composition root and dependency injection.      |
| **SwiftDataDomain**       | Core domain entities and protocols.             |
| **SwiftDataInfra**        | SwiftData-specific persistence implementation.  |
| **SwiftDataPresentation** | UI Views and ViewModel, free from persistence details. |

## 🚀 Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/belkhadir/SwiftDataApp/
    ```

2. Open the project with Xcode and run:
    ```bash
    ⌘ + R
    ```

## 📖 Blog Post

For detailed explanations, visit the [full blog article here](https://swiftorbit.io/decoupling-swiftdata-swiftui-clean-architecture/).

---
