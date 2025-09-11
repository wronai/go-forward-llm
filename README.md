# go-forward-llm
Do it LLM - Go Forward LLM with my project

Jasne! Możemy zrobić **onelinery**, które pozwolą uruchomić agenta od razu, bez wcześniejszego zapisywania pliku – skrypt zostanie pobrany i uruchomiony dynamicznie. Poniżej propozycje dla **Linux** i **Windows PowerShell**:

---

## **Linux Oneliner**

Pobiera i uruchamia dynamicznego agenta w jednym kroku:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/wronai/go-forward-llm/main/dev_agent.sh)"
```

**Jak działa:**

* `curl` pobiera skrypt z repozytorium.
* `bash -c` uruchamia go bezpośrednio w powłoce.

---

## **Windows PowerShell Oneliner**

Pobiera i uruchamia agenta dynamicznego w PowerShell:

```powershell
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/wronai/go-forward-llm/main/dev_agent.ps1')
```

**Jak działa:**

* `DownloadString` pobiera zawartość skryptu z repo.
* `Invoke-Expression` wykonuje pobrany skrypt natychmiast.

> Tak samo – zamień `USERNAME` na właściwe repo.

---

✅ **Cechy onelinerów:**

* Działa natychmiast, bez ręcznego pobierania pliku.
* Automatycznie tworzy wszystkie podskrypty i katalogi potrzebne agentowi.
* Zachowuje pełną wielowarstwowość i mechanizm self-healing.
* Linux: wymaga `bash` i `curl`.
* Windows: wymaga PowerShell 5+ i dostępu do internetu.


---

## Linux Agent

Skrypt automatyzuje projekt od **instalacji, przez walidację, naprawę, testy, aż po uruchomienie**. Tworzy wszystkie niezbędne katalogi i podskrypty, jeśli ich nie ma, a następnie uruchamia cały cykl.

### Jak użyć:

1. Zapisz skrypt np. jako `dev_agent.sh`.
2. Nadaj prawa do wykonania:

   ```bash
   chmod +x dev_agent.sh
````

3. Uruchom w katalogu projektu:

   ```bash
   ./dev_agent.sh
   ```
4. Skrypt automatycznie tworzy podskrypty i uruchamia je w kolejności, wielowarstwowo, naprawiając problemy po drodze.

### Cechy:

* Automatyczne tworzenie wszystkich potrzebnych podskryptów, jeśli ich brak.
* Wielowarstwowa struktura – w razie błędów wywołuje kolejne warstwy naprawy.
* Generowanie logów i diagnostyki.
* Umożliwia uruchomienie projektu niezależnie od jego obecnego stanu.
* Integracja narzędzi CLI typu Winsurf i Cursor, jeśli dostępne w systemie.
* Dynamiczne, self-healing naprawy – agent generuje nowe podskrypty naprawcze w locie na podstawie logów.

---

## Windows Agent (PowerShell)

Skrypt działa natywnie na Windows i automatyzuje projekt w sposób **wielowarstwowy i self-healing**.

### Funkcjonalności:

* Automatycznie instaluje zależności (Python, moduły pip)
* Waliduje projekt (pliki, konfiguracje)
* Wykonuje podstawowe i zaawansowane naprawy
* Generuje logi i raporty
* Testuje projekt (unit/regression)
* Buduje i uruchamia projekt
* Zachowuje **rekurencyjny, wielowarstwowy mechanizm**, pozwalający „pchać projekt do przodu” niezależnie od etapu
* Integracja z narzędziami CLI typu Winsurf / Cursor, jeśli są obecne
* Dynamiczne tworzenie podskryptów naprawczych w locie (self-healing)

### Jak używać:

1. Zapisz skrypt np. jako `dev_agent.ps1`.
2. W PowerShell ustaw politykę uruchamiania (jeśli potrzebne):

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```
3. Uruchom w katalogu projektu:

   ```powershell
   .\dev_agent.ps1
   ```

### Cechy tej wersji:

* Działa natywnie na Windows, bez potrzeby WSL.
* Każdy krok ma fallback i może być rozszerzany o nowe podskrypty.
* Automatycznie tworzy brakujące podskrypty.
* Można rozszerzać o testy jednostkowe, regresyjne i integrację z GUI narzędzi typu Winsurf / Cursor.
* Dynamiczne, self-healing – nowe naprawy generowane w locie na podstawie logów.

---

## Uwagi

* Obie wersje agenta (Linux i Windows) umożliwiają **ciągłe przesuwanie projektu do przodu**, niezależnie od tego, na którym etapie napotkają problemy.
* Architektura wielowarstwowa i wielopoziomowa pozwala na **ciągłe doskonalenie projektu**, automatyczne naprawy i pełną diagnostykę.
