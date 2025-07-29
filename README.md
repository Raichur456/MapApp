# 🗺️ MapApp

**MapApp** is a SwiftUI-based iOS application that displays famous landmarks on a map, provides detailed previews, and supports rich user interactions such as location selection, animated transitions, and a full-screen detail view.

---

## ✨ Features

- 📍 Interactive map with custom location annotations
- 🪄 Animated location preview cards
- 🔍 "Learn More" button opens detailed view with images, description, and embedded map
- 📚 Wikipedia integration for each landmark
- 💻 Adaptive layout support for iPhone and iPad
- 🎨 Clean, modern SwiftUI interface using `@State`, `@Binding`, `@EnvironmentObject`, and `@Published`

---

## 🧱 Architecture

- **Model:** `Location` struct conforming to `Identifiable` & `Equatable`
- **ViewModel:** `LocationsViewModel` handles map region updates, selected location state, and sheet logic
- **Views:**
  - `LocationsView` – main map + preview UI
  - `LocationPreviewView` – small card view with image and buttons
  - `LocationDetailView` – full detail screen with scrollable layout
  - `LocationMapAnnotationView` – custom map pin

---

## 🚀 Getting Started

### Requirements
- Xcode 15+
- iOS 16.0+
- Swift 5.9+
- SwiftUI

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MapApp.git
   cd MapApp
