$dirs = @("src","bin","app") | Where-Object { Test-Path $_ }
Write-Output "Znalezione katalogi: $($dirs -join ', ')"

# Zlicz rozszerzenia
$files = Get-ChildItem -Recurse -File
$ext = $files | Group-Object Extension | Sort-Object Count -Descending | Select-Object -First 1
$EXT = $ext.Name.TrimStart(".")
Write-Output "Najczęściej używany język: $EXT"

# Dopasuj komendę startową
switch ($EXT) {
    "py" { 
        $entry = Get-ChildItem -Recurse -Filter *.py | Select-Object -First 1
        $cmd = "python $($entry.FullName)"
    }
    "js" { 
        $entry = Get-ChildItem -Recurse -Filter *.js | Select-Object -First 1
        $cmd = "node $($entry.FullName)"
    }
    "c" {"cpp" { 
        if (Test-Path Makefile) { $cmd = "make run" }
        else { 
            $entry = Get-ChildItem -Recurse -Filter *.$EXT | Select-Object -First 1
            $bin = Join-Path "bin" ($entry.BaseName + ".exe")
            New-Item -ItemType Directory -Force -Path bin
            $cmd = "gcc $($entry.FullName) -o $bin; $bin"
        }
    }}
    "java" { 
        $entry = Get-ChildItem -Recurse -Filter *.java | Select-Object -First 1
        $cmd = "javac $($entry.FullName); java $($entry.BaseName)"
    }
    default { $cmd = "Write-Output 'Nie udało się wykryć języka'" }
}

Write-Output "Uruchamiam projekt: $cmd"
Invoke-Expression $cmd
