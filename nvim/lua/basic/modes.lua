local modeStore = {}
local globalActiveModes = {}

local function toggleGlobalActiveModes(mode)
	if mode.globalValue then
		globalActiveModes[mode.id] = nil
	else
		globalActiveModes[mode.id] = { id = mode.id, icon = mode.icon }
	end
end

local function modeClass()
	local Mode = {
		id = "Mode",
		globalValue = false,
		toggleFn = nil,
	}
	Mode.__index = Mode

	function Mode:toggle()
		toggleGlobalActiveModes(self)
		self.globalValue = not self.globalValue
		self:toggleFn()
	end

	function Mode:isActive()
		return self.globalValue
	end

	function Mode.getValidIcon(id, icon)
		if icon == nil or icon == "" then
			return string.sub(id, 1, 1)
		else
			return icon
		end
	end

	function Mode.new(id, icon, toggleFn)
		local this = setmetatable({}, Mode)
		this.id = id
		this.icon = Mode.getValidIcon(id, icon)
		this.toggleFn = toggleFn
		this.activeBuffers = {}
		modeStore[this.id] = this
		return this
	end

	return Mode
end

-- Module start --
local M = {}

function M.createMode(id, icon, toggleFn)
	return modeClass().new(id, icon, toggleFn)
end

function M.getMode(id)
	return modeStore[id]
end

function M.getGlobalActiveModesIcons()
	local activeModeIcons = {}
	for _, v in pairs(globalActiveModes) do
		table.insert(activeModeIcons, v.icon)
	end
	return activeModeIcons
end

return M
