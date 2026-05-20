Invoke-Command -ScriptBlock {
    $item = $PWD.path | Join-Path -ChildPath ".inputrc" | Get-Item
    $dest = $env:USERPROFILE
    $item | Copy-Item -Destination $dest -Force -PassThru
}

Invoke-Command -ScriptBlock {
    $dest = $env:LOCALAPPDATA | Join-Path -ChildPath "clink"
    Get-ChildItem -file | Where-Object {$_.Name -eq "clink_settings" -or $_.Extension -eq ".lua"} | ForEach-Object {
        $_ | Copy-Item -Destination $dest -Force -PassThru
    }
}

