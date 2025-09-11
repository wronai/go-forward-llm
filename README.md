# go-forward-llm

Do it LLM – Go Forward LLM for my project

---

## Uniwersalny Agent – uruchamianie projektu

Skrypt automatycznie znajduje pliki startowe i targety w projekcie, niezależnie od języka programowania. Sprawdza kolejno:

1. `Makefile` – szuka targetu `run` lub `start`.
2. `README.md` – wyszukuje przykładowe komendy uruchamiające.
3. Typowe pliki startowe – np. `main.*`, `app.*`, `index.*`.

---

## Linux Oneliner

Pobiera i uruchamia dynamicznego agenta w jednym kroku:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/wronai/go-forward-llm/main/dev_agent.sh)"
```

**Jak działa:**

* `curl` pobiera skrypt z repozytorium.
* `bash -c` uruchamia go bezpośrednio w powłoce.

---

## Windows PowerShell Oneliner

```powershell
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/wronai/go-forward-llm/main/dev_agent.ps1')
```

**Jak działa:**

* Pobiera zawartość skryptu z repo.
* Uruchamia go natychmiast przy użyciu PowerShell.

---

## Linux Agent

Skrypt automatyzuje projekt od **instalacji, przez walidację, naprawę, testy, aż po uruchomienie**.

### Jak użyć:

1. Zapisz skrypt jako `dev_agent.sh`.
2. Nadaj prawa do wykonania:

```bash
chmod +x dev_agent.sh
```

3. Uruchom w katalogu projektu:

```bash
./dev_agent.sh
```

### Funkcjonalności:

* Automatyczne tworzenie brakujących podskryptów.
* Wielowarstwowa struktura – w razie błędów wywołuje kolejne warstwy naprawcze.
* Logi i diagnostyka.
* Uruchamianie projektu niezależnie od jego stanu.
* Integracja narzędzi CLI (Winsurf, Cursor), jeśli dostępne.
* Dynamiczne, self-healing naprawy na podstawie logów.

---

## Windows Agent (PowerShell)

### Funkcjonalności:

* Automatyczna instalacja zależności (Python, pip, Node, itp.).
* Walidacja projektu (pliki, konfiguracje).
* Podstawowe i zaawansowane naprawy.
* Generowanie logów i raportów.
* Testowanie (unit, regression).
* Budowanie i uruchamianie projektu.
* Wielowarstwowy mechanizm „push forward” – projekt może być uruchamiany niezależnie od etapu.
* Integracja z narzędziami CLI (Winsurf, Cursor), jeśli dostępne.
* Dynamiczne tworzenie podskryptów naprawczych w locie.

### Jak używać:

1. Zapisz skrypt jako `dev_agent.ps1`.
2. W PowerShell ustaw politykę uruchamiania (jeśli potrzebne):

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

3. Uruchom w katalogu projektu:

```powershell
.\dev_agent.ps1
```

---

## Uwagi

* Skrypt działa niezależnie od języka programowania.
* Architektura wielowarstwowa i self-healing zapewnia ciągłe przesuwanie projektu do przodu.
* Automatycznie naprawia problemy, generuje logi i diagnozuje projekt.
* Możliwość rozbudowy o dodatkowe testy i integracje.
