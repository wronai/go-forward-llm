#!/usr/bin/env bash

# 1. Wykryj katalogi
PROJECT_DIR=$(pwd)
for dir in src bin app; do
    if [ -d "$dir" ]; then
        echo "Znaleziono katalog: $dir"
    fi
done

# 2. Zlicz rozszerzenia i wybierz najczęściej używany język
EXT=$(find . -type f | sed -n 's/.*\.\([a-zA-Z0-9]\+\)$/\1/p' | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
echo "Najczęściej używany język/rozszerzenie: $EXT"

# 3. Dopasuj komendę startową
CMD=""
case $EXT in
    py)
        ENTRY=$(find src app -name "*.py" | head -1)
        CMD="python $ENTRY"
        ;;
    js)
        ENTRY=$(find src app -name "*.js" | head -1)
        CMD="node $ENTRY"
        ;;
    c|cpp)
        if [ -f Makefile ]; then
            CMD="make run"
        else
            ENTRY=$(find src -name "*.$EXT" | head -1)
            BIN="./bin/$(basename "$ENTRY" .$EXT)"
            mkdir -p bin
            CMD="gcc $ENTRY -o $BIN && $BIN"
        fi
        ;;
    java)
        ENTRY=$(find src app -name "*.java" | head -1)
        CMD="javac $ENTRY && java $(basename "$ENTRY" .java)"
        ;;
    *)
        CMD="echo 'Nie udało się wykryć języka, sprawdź README lub Makefile'"
        ;;
esac

# 4. Uruchom komendę
echo "Uruchamiam projekt: $CMD"
eval $CMD
