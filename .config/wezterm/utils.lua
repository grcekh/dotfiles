local M = {}

function M.basename(s)
	local result = string.gsub(s, "(.*[/\\])(.*)", "%2")
	return result or ""
end

-- Merges two tables. If the same key exists in both tables,
-- the value from the second table is used.
function M.table_merge(...)
	local merged = {}
	local tables = { ... }
	for _, t in ipairs(tables) do
		for k, v in pairs(t) do
			merged[k] = v
		end
	end
	return merged
end

-- Helper function to print the contents of a table.
-- https://stackoverflow.com/a/42062321
function M.table_print(node)
	local cache, stack, output = {}, {}, {}
	local depth = 1
	local output_str = "{\n"

	while true do
		local size = 0
		for k, v in pairs(node) do
			size = size + 1
		end

		local cur_index = 1
		for k, v in pairs(node) do
			if (cache[node] == nil) or (cur_index >= cache[node]) then
				if string.find(output_str, "}", output_str:len()) then
					output_str = output_str .. ",\n"
				elseif not (string.find(output_str, "\n", output_str:len())) then
					output_str = output_str .. "\n"
				end

				-- Necessary to avoid running out of memory when working with large tables
				table.insert(output, output_str)
				output_str = ""

				local key
				if type(k) == "number" or type(k) == "boolean" then
					key = "[" .. tostring(k) .. "]"
				else
					key = "['" .. tostring(k) .. "']"
				end

				if type(v) == "number" or type(v) == "boolean" then
					output_str = output_str .. string.rep("\t", depth) .. key .. " = " .. tostring(v)
				elseif type(v) == "table" then
					output_str = output_str .. string.rep("\t", depth) .. key .. " = {\n"
					table.insert(stack, node)
					table.insert(stack, v)
					cache[node] = cur_index + 1
					break
				else
					output_str = output_str .. string.rep("\t", depth) .. key .. " = '" .. tostring(v) .. "'"
				end

				if cur_index == size then
					output_str = output_str .. "\n" .. string.rep("\t", depth - 1) .. "}"
				else
					output_str = output_str .. ","
				end
			else
				-- close the table
				if cur_index == size then
					output_str = output_str .. "\n" .. string.rep("\t", depth - 1) .. "}"
				end
			end

			cur_index = cur_index + 1
		end

		if size == 0 then
			output_str = output_str .. "\n" .. string.rep("\t", depth - 1) .. "}"
		end

		if #stack > 0 then
			node = stack[#stack]
			stack[#stack] = nil
			depth = cache[node] == nil and depth + 1 or depth - 1
		else
			break
		end
	end

	-- Necessary to avoid running out of memory when working with large tables
	table.insert(output, output_str)
	output_str = table.concat(output)

	print(output_str)
end

return M
