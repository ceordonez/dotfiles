-- This configuration file sets up automatic kernel selection and output
-- import/export for Jupyter (.ipynb) files in molten.nvim.

-- Create a shared autocommand group for cleanliness
local M = {}
M.augroup_name = "MoltenAutomations"
local molten_augroup = vim.api.nvim_create_augroup(M.augroup_name, { clear = true })

--- Safely extracts the kernel name from a notebook's metadata.
--- This prevents the "attempt to call a nil value" error.
local function try_kernel_name(file_path)
    -- Read file content. Using pcall to handle potential IO errors.
    local read_ok, lines = pcall(vim.fn.readfile, file_path)
    if not read_ok or not lines or #lines == 0 then
        return nil
    end
    
    local content = table.concat(lines, "\n")
    local decode_ok, decoded_json = pcall(vim.json.decode, content)

    -- Check for successful decode and required structure (metadata -> kernelspec -> name)
    if decode_ok and type(decoded_json) == 'table' then
        local metadata = decoded_json.metadata
        
        -- Access the correct metadata path in the notebook's JSON
        if metadata and metadata.kernelspec and metadata.kernelspec.name then
            return metadata.kernelspec.name
        end
    end

    return nil
end


--- The main function to initialize the Molten buffer.
local imb = function(e)
    vim.schedule(function()
        -- FIX: Introduce a small delay (50ms) to ensure file is fully stable 
        -- after the BufReadPost event, preventing JSON read errors.
        vim.loop.sleep(50, false)
        
        local kernels = vim.fn.MoltenAvailableKernels()
        local kernel_name = nil

        -- 1. Try to get kernel name from notebook metadata (e.file)
        kernel_name = try_kernel_name(e.file)

        -- 2. Check if the name from metadata is valid and available
        if kernel_name == nil or not vim.tbl_contains(kernels, kernel_name) then
            kernel_name = nil
            
            -- Fallback logic: check if the active VENV name is a registered kernel
            local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")

            if venv ~= nil then
                -- Extract the folder name (e.g., 'test' from the path)
                local venv_folder_name = string.match(venv, "/.+/(.+)")
                
                -- Check if this folder name ('test') is a registered kernel name
                if venv_folder_name ~= nil and vim.tbl_contains(kernels, venv_folder_name) then
                    kernel_name = venv_folder_name
                end
            end
        end

        -- 3. Initialize Molten 
        if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
            -- Initializes with 'test' since it matches the file and the available kernels list
            vim.cmd(("MoltenInit %s"):format(kernel_name))
        else
            -- Final fallback: prompt the user if auto-detection failed
            vim.cmd("MoltenInit")
        end

        vim.cmd("MoltenImportOutput")
    end)
end


-- =======================================================
-- AUTOCMDS 
-- =======================================================

-- 1. Initialize and import output once when the file is read.
-- Uses BufReadPost to ensure file is loaded, and a shared group.
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*.ipynb" }, -- Added *.md for Jupytext
    callback = imb,
    group = molten_augroup,
})


-- 2. Automatically export output chunks to a jupyter notebook on write
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.ipynb" },
	callback = function()
		if require("molten.status").initialized() == "Molten" then
			vim.cmd("MoltenExportOutput!")
		end
	end,
    group = molten_augroup,
})
