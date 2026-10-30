rl.setbinding([["\x0e"]], "clink-forward-bigword")

function Insert_nu_command(rl_buffer)
    rl_buffer:insert("nu --experimental-options=native-clip")
end

rl.setbinding([["\en"]], [["luafunc:Insert_nu_command"]])

function Insert_xefm_command(rl_buffer)
    rl_buffer:insert("xefm --left . --right .")
end

rl.setbinding([["\ef"]], [["luafunc:Insert_xefm_command"]])

function Insert_desktop_path(rl_buffer)
    local userprofile = os.getenv("USERPROFILE")
    if not userprofile then return end

    local desktop = userprofile .. "\\Desktop\\"
    rl_buffer:insert(desktop)
end

rl.setbinding([["\ei"]], [["luafunc:Insert_desktop_path"]])
