function Forward_bigword_with_space(rl_buffer)
    if rl_buffer:getbuffer() == "" then return end

    local pos = rl_buffer:getcursor()
    local len = rl_buffer:getlength()

    if pos ~= len + 1 then return end
    rl.invokecommand("clink-forward-bigword")
    rl_buffer:insert(" ")
end

rl.setbinding([["\x0e"]], [["luafunc:Forward_bigword_with_space"]])
