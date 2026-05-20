function Forward_bigword_with_space(rl_buffer)
    rl.invokecommand("clink-forward-bigword")
    rl_buffer:insert(" ")
end
