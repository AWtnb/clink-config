function Insert_desktop_path(rl_buffer)
    local userprofile = os.getenv("USERPROFILE")
    if not userprofile then return end

    local desktop = userprofile .. "\\Desktop\\"
    rl_buffer:insert(desktop)
end

rl.setbinding([["\ei"]], [["luafunc:Insert_desktop_path"]])


function Reload_clink_config(rl_buffer)
    os.execute("clink inject")
    rl_buffer:refreshline()
end

rl.setbinding([["\er"]], [["luafunc:Reload_clink_config"]])
