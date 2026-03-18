Pamiętaj o tej hierarchii, bo ona chroni Cię przed błędami przy skalowaniu projektu:

* **Model (Domain):** To „czysty Dart”. Żadnych importów z Fluttera, żadnego Riverpoda. Tylko dane (`Freezed`) i czysta matematyka (logika biznesowa).
* **Repository (Data):** Jedyny łącznik z „brudnym światem” (Drift, Firebase, API). Repozytorium ma interfejs (`abstract class`), dzięki czemu łatwo podmienić bazę danych.
* **Provider/Notifier (Application):** Dyrygent. Nie liczy sam matematyki, nie wie jak zapisać do SQL. On tylko mówi: „Matematyko, policz to”, „Repozytorium, zapisz tamto”, „UI, oto nowy stan”.

Kopiuj te punkty do swojego promptu, jeśli chcesz wymusić profesjonalne rozwiązanie:

> **„Zastosuj architekturę warstwową (Clean Architecture) z Riverpodem:”**
>
> 1.  **Logic Separation:** Wydziel całą logikę obliczeniową do statycznej klasy narzędziowej (Pure Dart), aby była testowalna niezależnie od frameworka.
> 2.  **Repository Pattern:** Stwórz interfejs (`abstract class`) dla warstwy danych i konkretną implementację. Notifier musi zależeć od interfejsu, a nie od konkretnej klasy bazy danych.
> 3.  **Interface-based DI:** Użyj Riverpoda do wstrzykiwania zależności przez interfejsy (np. `IAppLogger`, `IFeedRepository`).
> 4.  **Immutability:** Modele stanu muszą być oparte o `Freezed` z `abstract class` (aby uniknąć błędów analizatora).
> 5.  **Single Responsibility:** Notifier ma tylko zarządzać stanem i delegować zadania. Nie może zawierać zapytań SQL ani skomplikowanych wzorów matematycznych.
> 6.  **Error Handling:** Obsłuż błędy przez logger (korzystając z interfejsu loggera) i zwróć czytelne komunikaty.

---

### 3. Dlaczego to jest ważne?

| Cecha | Podejście "Amatorskie" | Podejście "Enterprise" |
| :--- | :--- | :--- |
| **Testy** | Trzeba odpalać emulator (wolno). | Testujesz samą matematykę w milisekundach. |
| **Zmiana bazy** | Musisz przepisać cały Notifier. | Zmieniasz jeden plik Repozytorium. |
| **Błędy** | Trudne do namierzenia (logika wymieszana z UI). | Jasno widać, czy błąd jest w liczeniu, czy w zapisie. |
| **Czytelność** | Plik Notifiera ma 500 linii. | Każdy plik ma po 50-100 linii i jedną funkcję. |

---