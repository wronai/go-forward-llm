#!/bin/bash
# =======================================
# Self-Healing Multi-layer Dev Agent - Linux
# Fully dynamic, integrates external CLI tools
# =======================================

set -e
set -o pipefail

PROJECT_ROOT=$(pwd)
SCRIPTS_DIR="$PROJECT_ROOT/dev_agent_scripts"

echo "[AGENT] Starting dynamic self-healing automation agent..."

mkdir -p "$SCRIPTS_DIR"

# --- Funkcja do tworzenia / aktualizacji skryptów ---
create_or_update_script() {
    local path="$1"
    local content="$2"
    if [ ! -f "$path" ]; then
        echo "[AGENT] Creating missing script: $path"
        echo "$content" > "$path"
        chmod +x "$path"
    else
        current=$(cat "$path")
        if [ "$current" != "$content" ]; then
            echo "[AGENT] Updating script: $path"
            echo "$content" > "$path"
            chmod +x "$path"
        fi
    fi
}

# --- Funkcja dynamicznej naprawy na podstawie logów ---
analyze_and_repair() {
    local log="$1"
    if [ -f "$log" ]; then
        errors=$(grep -Ei "error|failed|exception" "$log" || true)
        if [ -n "$errors" ]; then
            while read -r err; do
                echo "[AGENT] Detected error: $err"
                script_name="$SCRIPTS_DIR/repair_dynamic_$(uuidgen).sh"
                cat > "$script_name" <<EOL
#!/bin/bash
echo "[DYNAMIC REPAIR] Attempting fix for detected error"
# Error: $err
# Example: install missing Python package
pip install --upgrade somepackage
EOL
                chmod +x "$script_name"
                bash "$script_name" || echo "[AGENT] Dynamic repair failed"
            done <<< "$errors"
        fi
    fi
}

# --- Funkcja uruchamiania kroków z fallback ---
run_step() {
    local name="$1"
    shift
    echo "[AGENT] Running step: $name"
    if ! "$@"; then
        echo "[AGENT] Step $name failed, analyzing logs..."
        tmp_log="$SCRIPTS_DIR/tmp_${name}.log"
        "$@" &> "$tmp_log" || true
        analyze_and_repair "$tmp_log"
    fi
}

# --- Tworzenie podstawowych podskryptów ---
declare -A scripts
scripts["install.sh"]='#!/bin/bash
echo "[INSTALL] Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt
'

scripts["setup_env.sh"]='#!/bin/bash
echo "[ENV SETUP] Setting environment variables..."
export APP_ENV=development
export LOG_LEVEL=debug
'

scripts["repair_basic.sh"]='#!/bin/bash
echo "[REPAIR BASIC] Fixing common issues..."
[ -f config.yaml ] || cp config.sample.yaml config.yaml
'

scripts["repair_advanced.sh"]='#!/bin/bash
echo "[REPAIR ADVANCED] Fixing advanced issues..."
pip install --upgrade -r requirements.txt
'

scripts["deep_logs.sh"]='#!/bin/bash
echo "[DEEP LOGS] Gathering logs..."
mkdir -p logs
[ -f project.log ] && tail -n 100 project.log > logs/project_tail.log
'

scripts["run.sh"]='#!/bin/bash
echo "[RUN] Starting application..."
python3 main.py
'

scripts["tools_init.sh"]='#!/bin/bash
echo "[TOOLS] Detecting external CLI tools..."
for t in winsurf cursor; do
    if command -v $t &> /dev/null; then
        echo "[TOOLS] Found $t"
    else
        echo "[TOOLS] $t not found, skipping"
    fi
done
'

scripts["tools_run.sh"]='#!/bin/bash
echo "[TOOLS] Running external CLI tools..."
for t in winsurf cursor; do
    if command -v $t &> /dev/null; then
        $t --run || echo "[TOOLS] $t failed"
    fi
done
'

for name in "${!scripts[@]}"; do
    create_or_update_script "$SCRIPTS_DIR/$name" "${scripts[$name]}"
done

# --- Wielowarstwowy cykl automatyzacji ---
steps=(
"Install:$SCRIPTS_DIR/install.sh"
"Env Setup:$SCRIPTS_DIR/setup_env.sh"
"Repair Basic:$SCRIPTS_DIR/repair_basic.sh"
"Repair Advanced:$SCRIPTS_DIR/repair_advanced.sh"
"Deep Logs:$SCRIPTS_DIR/deep_logs.sh"
"Tools Init:$SCRIPTS_DIR/tools_init.sh"
"Tools Run:$SCRIPTS_DIR/tools_run.sh"
"Run Application:$SCRIPTS_DIR/run.sh"
)

for step in "${steps[@]}"; do
    IFS=":" read -r name cmd <<< "$step"
    run_step "$name" bash "$cmd"
done

echo "[AGENT] Dynamic self-healing automation complete!"
