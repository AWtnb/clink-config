Invoke-Command -ScriptBlock {
    clink set autosuggest.inline true

    $src = ".clink"
    $dest = $env:USERPROFILE | Join-Path -ChildPath $src
    if (Test-Path $dest) {
        Remove-Item -Path $dest -Recurse -ErrorAction SilentlyContinue
    }
    New-Item -Path $dest -Value ($PSScriptRoot | Join-Path -ChildPath $src) -ItemType Junction
    clink installscripts $dest
    [Environment]::SetEnvironmentVariable(
        "CLINK_SETTINGS",
        (Join-path $dest -ChildPath "clink_settings"),
        "User"
    )
}