--local dap = require('dap')
local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

local has_dap_ui, dapui = pcall(require, "dapui")
if not has_dap_ui then
  return
end

-- C/C++
-- Not working yet
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    --command = 'C:\\msys2\\path\\to\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
    command = os.getenv("HOME")..'/Development/cpptools-linux/debugAdapters/bin/OpenDebugAD7',
    --command = '\\wsl$\\Debian\\home\\madvi11ain\\cpptools-linux\\debugAdapters\\bin\\OpenDebugAD7',
    -- Windows only
    options = {
        detached = false
    }
}

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

-- PHP
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv("HOME")..'/Development/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
    pathMappings = {
        -- Specific for Pi App
        ["/srv/www"] = "${workspaceFolder}"
    }
  }
}

-- Debug UI Setup
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require "dapui".setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      --size = 40, -- 40 columns
      size = 50, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        --"console",
      },
      --size = 0.25, -- 25% of total lines
      size = 0.20, -- 25% of total lines
      position = "bottom",
    },
  }
}

require "nvim-dap-virtual-text".setup {}
