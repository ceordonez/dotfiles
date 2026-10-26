-- Markdown snippets. Each group lives in lua/snippets/markdown_parts/<name>.lua
-- To add a group: create the file there (it returns a list of snippets) and add its name below.
local parts = { "papers", "readmes", "meetings" }

local snippets = {}
for _, name in ipairs(parts) do
	local ok, group = pcall(require, "snippets.markdown_parts." .. name)
	if ok then
		vim.list_extend(snippets, group)
	else
		vim.notify("markdown snippets: could not load '" .. name .. "'\n" .. tostring(group), vim.log.levels.WARN)
	end
end

return snippets
