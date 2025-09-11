Jasne! Oto poprawiona i bardziej czytelna wersja Twojej dokumentacji z lepszym opisem funkcjonalności i przepływu działania. Zoptymalizowałem strukturę, dodałem jasne sekcje i lepiej opisałem ideę „continuous improvement” z użyciem Makefile i dynamicznych skryptów.

---

# go-forward-llm

**Go Forward LLM** – uniwersalny agent do automatyzacji i ciągłego udoskonalania projektów programistycznych przy pomocy LLM.

Celem projektu jest umożliwienie automatycznego uruchamiania, walidacji i naprawy projektów niezależnie od języka programowania oraz struktury repozytorium. Agent korzysta z warstwowych mechanizmów naprawczych i dynamicznego generowania skryptów przy użyciu promptów.

---

## Idea Continuous Improvement

Zamiast ręcznego uruchamiania kolejnych komend, agent realizuje koncepcję **self-healing pipelines**:

```bash
make install      # instalacja zależności
make validate     # walidacja projektu
make repair       # automatyczne naprawy
make test         # testy jednostkowe i regresyjne
make run          # uruchomienie projektu
```

Jeśli któraś z warstw nie powiedzie się:

1. Agent analizuje logi.
2. Tworzy i uruchamia odpowiednie podskrypty naprawcze.
3. Przechodzi do kolejnego etapu tylko, gdy bieżąca warstwa jest poprawnie wykonana.

W ten sposób projekt jest **ciągle przesuwany do przodu**, nawet jeśli występują błędy w konfiguracji lub zależnościach.

---

## Uniwersalny Agent – uruchamianie projektu

Agent automatycznie wykrywa pliki startowe i targety w projekcie:

1. **Makefile** – szuka targetu `run` lub `start`.
2. **README.md** – analizuje przykładowe komendy uruchamiające.
3. **Typowe pliki startowe** – np. `main.*`, `app.*`, `index.*`.

Dzięki temu działa niezależnie od języka programowania.

---

## Uruchomienie jednym poleceniem

### Linux

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/wronai/go-forward-llm/main/dev_agent.sh)"
```

**Jak działa:**

* `curl` pobiera skrypt z repozytorium.
* `bash -c` uruchamia go bezpośrednio w powłoce.

---

### Windows PowerShell

```powershell
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/wronai/go-forward-llm/main/dev_agent.ps1')
```

**Jak działa:**

* Pobiera zawartość skryptu z repo.
* Uruchamia go natychmiast w PowerShell.

---

## Linux Agent – funkcjonalności

1. Automatyczna instalacja zależności.
2. Walidacja projektu i struktury plików.
3. Wielowarstwowe naprawy (`install → validate → repair → test → run`).
4. Tworzenie brakujących podskryptów w locie.
5. Logowanie i diagnostyka.
6. Uruchamianie projektu niezależnie od jego stanu.
7. Integracja z narzędziami CLI (np. Winsurf, Cursor), jeśli dostępne.
8. Dynamiczne, self-healing naprawy na podstawie logów.

**Użycie:**

```bash
chmod +x dev_agent.sh
./dev_agent.sh
```

---

## Windows Agent (PowerShell) – funkcjonalności

1. Automatyczna instalacja zależności (Python, Node, pip itd.).
2. Walidacja projektu (pliki, konfiguracje).
3. Podstawowe i zaawansowane naprawy.
4. Generowanie logów i raportów.
5. Testowanie (unit, regression).
6. Budowanie i uruchamianie projektu.
7. Wielowarstwowy mechanizm „push forward”.
8. Integracja z CLI (Winsurf, Cursor) jeśli dostępne.
9. Dynamiczne generowanie podskryptów naprawczych w locie.

**Użycie:**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\dev_agent.ps1
```

---

## Uwagi

* Skrypt działa niezależnie od języka programowania.
* Architektura wielowarstwowa i self-healing zapewnia ciągłe przesuwanie projektu do przodu.
* Możliwość rozbudowy o dodatkowe testy i integracje.
* Idealny do CI/CD oraz projektów, które wymagają dynamicznego utrzymania i automatyzacji.







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
