local debuggers = {
    "gdb",
    --"xdebug"
}

for _, debugger in pairs(debuggers) do
    require("user.dap.settings."..debugger)
    --local dapconfig_status_ok, dapconfig = pcall(require, "user.dap.settings."..debugger)
    --if not dapconfig_status_ok then
        --return
    --end
end
