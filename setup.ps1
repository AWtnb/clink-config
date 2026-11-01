Invoke-Command -ScriptBlock {
    $src = ".clink"
    $profileDir = $env:USERPROFILE | Join-Path -ChildPath $src
    if (Test-Path $profileDir) {
        Remove-Item -Path $profileDir -Recurse -ErrorAction SilentlyContinue
    }
    New-Item -Path $profileDir -Value ($PSScriptRoot | Join-Path -ChildPath $src) -ItemType Junction
    

    [Environment]::SetEnvironmentVariable(
        "CLINK_SETTINGS",
        $profileDir,
        "User"
    )

    clink set autosuggest.enable true
    clink set autosuggest.inline true
    clink installscripts $profileDir
}