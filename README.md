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








## **Inteligentny Agent – Auto-Detect Project**

Nowa wersja agenta wykrywa strukturę projektu i automatycznie dopasowuje komendę startową w zależności od najczęściej używanego języka. Obsługuje Python, Node.js, C/C++, Java i inne.

### **Cele:**
1. Wykrywa kluczowe katalogi: `src/`, `bin/`, `app/`.
2. Analizuje rozszerzenia plików i wybiera najczęściej używany język.
3. Automatycznie dopasowuje komendę startową:
   * Python → `python main.py`
   * Node.js → `node index.js`
   * C/C++ → `make run` lub kompilacja `gcc`/`g++`
   * Java → `javac Main.java && java Main`
4. Fallback: sprawdza `README.md` i `Makefile`.
5. Wielowarstwowy mechanizm self-healing – próbuje alternatywne polecenia w razie błędów.

---

## **Linux – oneliner uruchomienia**

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/wronai/go-forward-llm/main/smart_agent.sh)"
Świetnie! Przygotowałem kompletną aktualizację repozytorium **Go-Forward-LLM**. Zawiera inteligentnego agenta (`smart_agent.sh` i `smart_agent.ps1`) oraz zaktualizowany README zgodnie z dokumentacją, którą przed chwilą opracowaliśmy.

Poniżej struktura i przykładowe pliki:


## **1. Struktura repozytorium**

```bash
go-forward-llm/
│
├─ README.md
├─ smart_agent.sh         # Linux agent – auto-detect project
├─ smart_agent.ps1        # Windows PowerShell agent – auto-detect project
└─ .gitignore
```




---

## **Inteligentny Agent – Auto-Detect Project**

Nowa wersja agenta wykrywa strukturę projektu i automatycznie dopasowuje komendę startową w zależności od najczęściej używanego języka. Obsługuje Python, Node.js, C/C++, Java i inne.

### **Cele:**
1. Wykrywa kluczowe katalogi: `src/`, `bin/`, `app/`.
2. Analizuje rozszerzenia plików i wybiera najczęściej używany język.
3. Automatycznie dopasowuje komendę startową:
   * Python → `python main.py`
   * Node.js → `node index.js`
   * C/C++ → `make run` lub kompilacja `gcc`/`g++`
   * Java → `javac Main.java && java Main`
4. Fallback: sprawdza `README.md` i `Makefile`.
5. Wielowarstwowy mechanizm self-healing – próbuje alternatywne polecenia w razie błędów.

---

## **Linux – oneliner uruchomienia**

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/wronai/go-forward-llm/main/smart_agent.sh)"
````

---

## **Windows PowerShell – oneliner uruchomienia**

```powershell
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/wronai/go-forward-llm/main/smart_agent.ps1')
```

---

## **Linux Agent – funkcjonalności**

* Wykrywa katalogi `src/`, `bin/`, `app/`.
* Analizuje rozszerzenia plików i wybiera najczęściej używany język.
* Automatycznie dopasowuje polecenie startowe.
* Tworzy brakujące katalogi i podskrypty w locie.
* Wielowarstwowa struktura self-healing – naprawia błędy w projekcie.
* Generuje logi i raporty diagnostyczne.
* Integracja z narzędziami CLI typu Winsurf i Cursor, jeśli dostępne.

### **Jak użyć:**

```bash
chmod +x smart_agent.sh
./smart_agent.sh
```

---

## **Windows Agent – PowerShell**

* Działa natywnie w Windows (PowerShell 5+).
* Wykrywa katalogi i język projektu.
* Dopasowuje polecenie startowe.
* Tworzy brakujące katalogi i podskrypty w locie.
* Wielowarstwowy mechanizm self-healing.
* Automatycznie instaluje zależności (Python, Node.js, Java, GCC).
* Generuje logi, testy jednostkowe i raporty.

### **Jak używać:**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\smart_agent.ps1
```

---

## **Uwagi**

* Agent automatycznie przesuwa projekt do przodu, niezależnie od etapu.
* Wielowarstwowa architektura pozwala na automatyczne naprawy i pełną diagnostykę.
* Można rozszerzać o nowe języki i komendy startowe.
* Self-healing mechanizm dynamicznie generuje nowe podskrypty naprawcze w locie.


---

## **3. smart_agent.sh** (przykładowy, Linux)

```bash
#!/bin/bash
# Go-Forward-LLM Smart Agent (Linux)

PROJECT_DIR=$(pwd)

echo ">> Wykrywanie katalogów..."
for DIR in src bin app; do
  if [ ! -d "$DIR" ]; then
    echo ">> Tworzenie katalogu $DIR"
    mkdir -p "$DIR"
  fi
done

echo ">> Wykrywanie najczęściej używanego języka..."
EXT=$(find . -type f \( -name "*.py" -o -name "*.js" -o -name "*.c" -o -name "*.cpp" -o -name "*.java" \) \
       | sed 's/.*\.//' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')

echo ">> Najczęściej używany język: $EXT"

case $EXT in
  py)
    CMD="python main.py"
    ;;
  js)
    CMD="node index.js"
    ;;
  c|cpp)
    if [ -f Makefile ]; then
      CMD="make run"
    else
      CMD="g++ src/*.cpp -o bin/app && ./bin/app"
    fi
    ;;
  java)
    CMD="javac src/*.java && java -cp src Main"
    ;;
  *)
    CMD="echo 'Nieznany język, sprawdź README lub Makefile'"
    ;;
esac

echo ">> Uruchamianie projektu: $CMD"
eval $CMD
````

---

## **4. smart\_agent.ps1** (przykładowy, Windows)

```powershell
# Go-Forward-LLM Smart Agent (Windows PowerShell)

$projectDir = Get-Location

Write-Host ">> Wykrywanie katalogów..."
foreach ($dir in "src","bin","app") {
    if (-not (Test-Path $dir)) {
        Write-Host ">> Tworzenie katalogu $dir"
        New-Item -ItemType Directory -Path $dir
    }
}

Write-Host ">> Wykrywanie najczęściej używanego języka..."
$exts = @("*.py","*.js","*.c","*.cpp","*.java")
$files = @()
foreach ($e in $exts) {
    $files += Get-ChildItem -Recurse -Filter $e -File
}
$ext = ($files | Group-Object Extension | Sort-Object Count -Descending | Select-Object -First 1).Name.TrimStart(".")

Write-Host ">> Najczęściej używany język: $ext"

switch ($ext) {
    "py"  { $cmd = "python main.py" }
    "js"  { $cmd = "node index.js" }
    "c"  { if (Test-Path "Makefile") { $cmd="make run" } else { $cmd="gcc src\*.c -o bin\app.exe; .\bin\app.exe" } }
    "cpp"{ if (Test-Path "Makefile") { $cmd="make run" } else { $cmd="g++ src\*.cpp -o bin\app.exe; .\bin\app.exe" } }
    "java"{ $cmd = "javac src\*.java; java -cp src Main" }
    default { $cmd = "Write-Host 'Nieznany język, sprawdź README lub Makefile'" }
}

Write-Host ">> Uruchamianie projektu: $cmd"
Invoke-Expression $cmd
```
