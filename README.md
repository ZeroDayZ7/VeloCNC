# VeloCNC

**VeloCNC** is a high-precision mobile toolbox designed for CNC machinists and engineers. Built with Flutter, it provides essential tools for everyday workshop calculations, technical references, and process optimization.

## Key Features

### 🚀 Machining Calculators (In Development)

* **Feed Rate (Vf) & Compensation** – Calculate linear feed rates with advanced compensation for internal and external arc milling (holes and bosses).
* **Cutting Speed (Vc)** – Quick determination of optimal cutting parameters for various materials.
* **Spindle RPM (n)** – Calculate precise spindle speeds based on tool diameter and cutting speed.
* **Unit Converter** – Fast conversion between Metric and Imperial systems for machining dimensions.

### 📚 Technical Reference (In Development)

* **G-Codes & M-Codes** – A comprehensive library of standard ISO G-codes for quick programming reference.
* **GD&T Symbols** – Detailed guide to Geometric Dimensioning and Tolerancing symbols and their meanings.
* **Tolerances & Fits** – Integrated ISO tolerance tables (e.g., H7/g6) for precision engineering.

## Technical Stack

* **Framework:** Flutter (Mobile)
* **State Management:** Riverpod (Notifier/AsyncNotifier)
* **Database:** Drift (SQLite) for calculation history tracking.
* **Logging:** Logger & AppLogger for debugging and stability.
* **Architecture:** Clean, modular structure for scalability.