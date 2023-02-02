local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    --command = 'C:\\msys2\\path\\to\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
    command = '/home/madvi11ain/cpptools-linux/debugAdapters/bin/OpenDebugAD7',
    --command = '\\wsl$\\Debian\\home\\madvi11ain\\cpptools-linux\\debugAdapters\\bin\\OpenDebugAD7',
    -- Windows only
    options = {
        detached = false
    }
}

local dap = require('dap')
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}
