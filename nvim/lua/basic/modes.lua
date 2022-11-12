local M = {}

local Modes = {}

function M.getModeClass()
	local Mode = {
		id = "Mode",
		value = false,
		toggleFn = nil,
	}
	Mode.__index = Mode

	function Mode:toggle()
		self.value = not self.value
		self:toggleFn()
	end

	function Mode.new(id, icon, toggleFn)
		local this = setmetatable({}, Mode)
		this.id = id
		if icon == nil or icon == "" then
			this.icon = string.sub(id, 1, 1)
		else
			this.icon = icon
		end
		this.toggleFn = toggleFn
		Modes[this.id] = this
		return this
	end

	return Mode
end

function M.getMode(id)
	return Modes[id]
end

function M.getActiveModes()
	local activeModes = {}
	for _, v in pairs(Modes) do
		if v.value then
			table.insert(activeModes, v.id)
		end
	end
	return table.concat(activeModes, ", ")
end

function M.getActiveModeIcons()
	local activeModes = {}
	for _, v in pairs(Modes) do
		if v.value then
			table.insert(activeModes, v.icon)
		end
	end
	return table.concat(activeModes, " | ")
end

return M
