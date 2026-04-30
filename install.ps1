Invoke-Command -ScriptBlock {
    $item = $PWD.path | Join-Path -ChildPath ".inputrc" | Get-Item
    $dest = $env:USERPROFILE
    $item | Copy-Item -Destination $dest -Force -PassThru
}

Invoke-Command -ScriptBlock {
    $item = $PWD.path | Join-Path -ChildPath "clink_settings" | Get-Item
    $dest = $env:LOCALAPPDATA | Join-Path -ChildPath "clink"
    $item | Copy-Item -Destination $dest -Force -PassThru
}

