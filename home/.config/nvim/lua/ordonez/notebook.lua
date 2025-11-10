-- automatically import output chunks from a jupyter notebook
-- tries to find a kernel that matches the kernel in the jupyter notebook
-- falls back to a kernel that matches the name of the active venv (if any)
-- local imb = function(e) -- init molten buffer
-- 	vim.schedule(function()
-- 		local kernels = vim.fn.MoltenAvailableKernels()
-- 		local try_kernel_name = function()
-- 			local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
-- 			return metadata.kernelspec.name
-- 		end
-- 		local ok, kernel_name = pcall(try_kernel_name)
-- 		if not ok or not vim.tbl_contains(kernels, kernel_name) then
-- 			kernel_name = nil
-- 			local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
-- 			if venv ~= nil then
-- 				kernel_name = string.match(venv, "/.+/(.+)")
-- 			end
-- 		end
-- 		if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
-- 			vim.cmd(("MoltenInit %s"):format(kernel_name))
-- 		end
-- 		vim.cmd("MoltenImportOutput")
-- 	end)
-- end
--
local imb = function(e) -- init molten buffer
    vim.schedule(function()
        local kernels = vim.fn.MoltenAvailableKernels()
        local try_kernel_name = function()
            -- Note: Using vim.fn.readfile might be more robust than io.open
            local content = table.concat(vim.fn.readfile(e.file), "\n")
            local metadata = vim.json.decode(content)["jupyter"]
            return metadata.kernelspec.name
        end
        local ok, kernel_name = pcall(try_kernel_name)
        if not ok then
            print("ERROR reading metadata: " .. tostring(kernel_name_or_err))
            vim.api.nvim_err_writeln("Molten Init Error: " .. tostring(kernel_name_or_err))
        end
        local kernel_name = ok and kernel_name_or_err or nil
        if not ok or not vim.tbl_contains(kernels, kernel_name) then
            kernel_name = nil
            local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
            if venv ~= nil then
                -- Assuming your venv is registered with a name like 'test_kernel'
                local venv_folder_name = string.match(venv, "/.+/(.+)")
                local expected_kernel_name = venv_folder_name .. "_kernel"
                if vim.tbl_contains(kernels, expected_kernel_name) then
                    kernel_name = expected_kernel_name
                end
            end
        end
        if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
            vim.cmd(("MoltenInit %s"):format(kernel_name))
        end
        vim.cmd("MoltenImportOutput")
    end)
end
-- 1. Initialize and import output once when the file is read.
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*.ipynb" },
    callback = imb,
    -- The 'once' flag ensures this autocmd is removed after it runs successfully
    -- on a buffer, preventing subsequent, redundant runs.
    -- group = vim.api.nvim_create_augroup("MoltenInitOnce", { clear = true }),
})

-- 2. Automatically export output chunks on write (keep this)
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.ipynb" },
	callback = function()
		if require("molten.status").initialized() == "Molten" then
			vim.cmd("MoltenExportOutput!")
		end
	end,
    -- group = "MoltenInitOnce", -- Use the same group for cleanliness
})

-- -- automatically import output chunks from a jupyter notebook
-- vim.api.nvim_create_autocmd("BufAdd", {
-- 	pattern = { "*.ipynb" },
-- 	callback = imb,
-- })
--
-- -- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = { "*.ipynb" },
-- 	callback = function(e)
-- 		if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
-- 			imb(e)
-- 		end
-- 	end,
-- })
-- -- automatically export output chunks to a jupyter notebook on write
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = { "*.ipynb" },
-- 	callback = function()
-- 		if require("molten.status").initialized() == "Molten" then
-- 			vim.cmd("MoltenExportOutput!")
-- 		end
-- 	end,
-- })
-- Provide a command to create a blank new Python notebook
-- note: the metadata is needed for Jupytext to understand how to parse the notebook.
-- if you use another language than Python, you should change it in the template.
local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

local function new_notebook(filename)
  local path = filename .. ".ipynb"
  local file = io.open(path, "w")
  if file then
    file:write(default_notebook)
    file:close()
    vim.cmd("edit " .. path)
  else
    print("Error: Could not open new notebook file for writing.")
  end
end

vim.api.nvim_create_user_command('NewNotebook', function(opts)
  new_notebook(opts.args)
end, {
  nargs = 1,
  complete = 'file'
})
