# =======================================
# Self-Healing Multi-layer Dev Agent - Windows PowerShell
# Fully dynamic, integrates Winsurf & Cursor
# =======================================

$ErrorActionPreference = "Stop"

$ProjectRoot = Get-Location
$ScriptsDir = Join-Path $ProjectRoot "dev_agent_scripts"

Write-Host "[AGENT] Starting dynamic self-healing automation agent..."

# --- Tworzymy katalog na skrypty jeśli brak ---
If (!(Test-Path $ScriptsDir)) { New-Item -ItemType Directory -Path $ScriptsDir | Out-Null }

# --- Funkcja do tworzenia / aktualizacji skryptów ---
function CreateOrUpdate-Script {
    param([string]$Path, [string]$Content)
    if (-not (Test-Path $Path)) {
        Write-Host "[AGENT] Creating missing script: $Path"
        $Content | Out-File -FilePath $Path -Encoding UTF8
        Set-ItemProperty -Path $Path -Name IsReadOnly -Value $false
    } else {
        # sprawdzamy czy zawartość się zmieniła, jeśli tak aktualizujemy
        $current = Get-Content $Path -Raw
        if ($current -ne $Content) {
            Write-Host "[AGENT] Updating script: $Path"
            $Content | Out-File -FilePath $Path -Encoding UTF8
        }
    }
    # nadajemy prawa do wykonania
    Unblock-File $Path
}

# --- Funkcja do dynamicznej naprawy na podstawie logów ---
function Analyze-And-Repair {
    param([string]$LogPath)
    if (Test-Path $LogPath) {
        $errors = Select-String -Path $LogPath -Pattern "Error|Failed|Exception"
        foreach ($err in $errors) {
            $errMsg = $err.Line
            Write-Warning "[AGENT] Detected error: $errMsg"
            $scriptName = Join-Path $ScriptsDir ("repair_dynamic_" + ([Guid]::NewGuid().ToString()) + ".ps1")
            $content = @"
# Auto-generated repair script
Write-Host '[DYNAMIC REPAIR] Attempting fix for detected error'
# Custom logic based on error:
# $errMsg
# Example: if Python package missing, install
pip install --upgrade somepackage
"@
            CreateOrUpdate-Script $scriptName $content
            # Uruchamiamy nowy skrypt naprawczy
            try { & $scriptName } catch { Write-Warning "[AGENT] Dynamic repair failed" }
        }
    }
}

# --- Podstawowe kroki projektowe ---
function Run-Step {
    param([string]$Name, [ScriptBlock]$Command)
    Write-Host "[AGENT] Running step: $Name"
    try { & $Command }
    catch {
        Write-Warning "[AGENT] Step $Name failed, generating dynamic repair..."
        # Tworzymy log tymczasowy i analizujemy
        $tmpLog = Join-Path $ScriptsDir "tmp_$($Name).log"
        & $Command *>$tmpLog 2>&1
        Analyze-And-Repair $tmpLog
    }
}

# --- Tworzenie podstawowych podskryptów ---
$basicScripts = @{
    "install.ps1" = 'Write-Host "[INSTALL] Installing dependencies..."; python -m pip install --upgrade pip; python -m pip install -r requirements.txt'
    "setup_env.ps1" = 'Write-Host "[ENV] Setting environment variables..."; $env:APP_ENV="development"; $env:LOG_LEVEL="debug"'
    "repair_basic.ps1" = 'Write-Host "[REPAIR BASIC] Fixing common issues..."; if (-not (Test-Path "config.yaml")) { Copy-Item "config.sample.yaml" "config.yaml" }'
    "repair_advanced.ps1" = 'Write-Host "[REPAIR ADVANCED] Fixing advanced issues..."; python -m pip install --upgrade -r requirements.txt'
    "deep_logs.ps1" = 'Write-Host "[LOGS] Gathering logs..."; if (-not (Test-Path "logs")) { New-Item -ItemType Directory -Path "logs" | Out-Null }; if (Test-Path "project.log") { Get-Content "project.log" -Tail 100 | Out-File "logs/project_tail.log" }'
    "run.ps1" = 'Write-Host "[RUN] Starting application..."; python main.py'
    "tools_init.ps1" = 'Write-Host "[TOOLS] Detecting Winsurf and Cursor"; $tools=@("winsurf.exe","cursor.exe"); foreach($t in $tools){if(Get-Command $t -ErrorAction SilentlyContinue){Write-Host "Found $t"}else{Write-Warning "$t not found"}}'
    "tools_run.ps1" = 'Write-Host "[TOOLS] Running external tools"; $winsurf=Get-Command "winsurf.exe" -ErrorAction SilentlyContinue; $cursor=Get-Command "cursor.exe" -ErrorAction SilentlyContinue; if($winsurf){& $winsurf /run}; if($cursor){& $cursor /run}'
}

foreach ($name in $basicScripts.Keys) {
    $path = Join-Path $ScriptsDir $name
    CreateOrUpdate-Script $path $basicScripts[$name]
}

# --- Wielowarstwowy cykl automatyzacji ---
$steps = @(
    @{Name="Install"; Command={ & "$ScriptsDir\install.ps1" }},
    @{Name="Env Setup"; Command={ & "$ScriptsDir\setup_env.ps1" }},
    @{Name="Repair Basic"; Command={ & "$ScriptsDir\repair_basic.ps1" }},
    @{Name="Repair Advanced"; Command={ & "$ScriptsDir\repair_advanced.ps1" }},
    @{Name="Deep Logs"; Command={ & "$ScriptsDir\deep_logs.ps1" }},
    @{Name="Tools Init"; Command={ & "$ScriptsDir\tools_init.ps1" }},
    @{Name="Tools Run"; Command={ & "$ScriptsDir\tools_run.ps1" }},
    @{Name="Run Application"; Command={ & "$ScriptsDir\run.ps1" }}
)

foreach ($step in $steps) {
    Run-Step $step.Name $step.Command
}

Write-Host "[AGENT] Dynamic self-healing automation complete!"
