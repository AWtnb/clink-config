Invoke-Command -ScriptBlock {
    $profileDir = Join-Path $env:USERPROFILE ".clink"

    [Environment]::SetEnvironmentVariable(
        "CLINK_SETTINGS",
        $profileDir,
        "User"
    )

    clink set autosuggest.enable true
    clink set autosuggest.inline true
}