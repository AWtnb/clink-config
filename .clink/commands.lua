rl.setbinding([["\x0e"]], "clink-forward-bigword")

function Insert_nu_command(rl_buffer)
    rl_buffer:insert("nu --experimental-options=native-clip")
    rl.invokecommand("accept-line")
end

rl.setbinding([["\en"]], [["luafunc:Insert_nu_command"]])

function Insert_xefm_command(rl_buffer)
    rl_buffer:insert("xefm --left . --right .")
    rl.invokecommand("accept-line")
end

rl.setbinding([["\ef"]], [["luafunc:Insert_xefm_command"]])

function Insert_desktop_path(rl_buffer)
    local userprofile = os.getenv("USERPROFILE")
    if not userprofile then return end

    local desktop = userprofile .. "\\Desktop\\"
    rl_buffer:insert(desktop)
end

rl.setbinding([["\ei"]], [["luafunc:Insert_desktop_path"]])

local function fzf_select(input_cmd)
    local f = io.popen(input_cmd .. ' | fzf --height 40% --reverse')
    if not f then return nil end
    local result = f:read('*l')
    f:close()
    return result
end

function Fzf_ghq(rl_buffer)
    local userprofile = os.getenv("USERPROFILE")
    if not userprofile then return end

    local ghqRoot = userprofile .. "\\ghq\\"

    local sel = fzf_select('ghq list')
    if sel and sel ~= '' then
        sel = sel:gsub("/", "\\")
        rl_buffer:beginundogroup()
        rl_buffer:remove(1, rl_buffer:getlength() + 1)
        rl_buffer:insert('cd /d "' .. ghqRoot .. sel .. '"')
        rl_buffer:endundogroup()
        rl.invokecommand("accept-line")
    else
        rl_buffer:refreshline()
    end
end

rl.setbinding([["\C-g"]], [["luafunc:Fzf_ghq"]])
