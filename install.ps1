Invoke-Command -ScriptBlock {
    $dest = $env:LOCALAPPDATA | Join-Path -ChildPath "clink"
    Get-ChildItem -file | Where-Object {$_.Name -eq "clink_settings" -or $_.Extension -eq ".lua"} | ForEach-Object {
        $_ | Copy-Item -Destination $dest -Force -PassThru
    }
}

