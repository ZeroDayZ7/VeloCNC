lib/
├── core/
│   ├── formulas/
│   │   └── threading_math.dart      # Czysta matematyka: RPM, Feed, Ø wierteł
│   └── utils/
│       └── iso_513_manager.dart     # Logika parsująca Twoje pliki JSON
├── features/
│   └── threading/
│       ├── data/
│       │   ├── models/
│       │   │   ├── thread_standard.dart # Klasa dla gwintu (M, MF, UNC)
│       │   │   └── material_iso.dart    # Klasa dla ISO P, M, K...
│       │   └── repositories/
│       │       └── thread_repository.dart # Ładowanie danych z JSONów
│       ├── presentation/
│       │   ├── cubit/ (lub provider)  # Zarządzanie stanem kalkulatora
│       │   ├── pages/
│       │   │   └── threading_page.dart  # Główny ekran (Twoja "bitwa")
│       │   └── widgets/
│       │       ├── material_selector.dart # Wybór ISO P, M, K (wizualny)
│       │       ├── thread_params_card.dart # Wybór rozmiaru i skoku
│       │       ├── results_hero_section.dart # Wielki wynik (CncResultCard)
│       │       └── technical_details_tile.dart # Rozwijane info (Pitch, Swelling)