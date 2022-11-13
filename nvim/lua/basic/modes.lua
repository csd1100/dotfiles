local modeStore = {}
local globalActiveModes = {}

local function toggleGlobalActiveModes(mode)
	if mode.globalValue then
		globalActiveModes[mode.id] = nil
	else
		globalActiveModes[mode.id] = { id = mode.id, icon = mode.icon }
	end
end

local function handleGlobalToggle(mode)
	toggleGlobalActiveModes(mode)
	mode.globalValue = not mode.globalValue
	mode:toggleFn()
end

local function addToActiveBuffers(mode, bufnr)
	if mode.activeBuffers[bufnr] then
		mode.activeBuffers[bufnr] = nil
	else
		mode.activeBuffers[bufnr] = true
	end
end

local function handleToggleWithFilter(mode, filter)
	if not mode.globalValue then
		addToActiveBuffers(mode, filter.buffer)
		mode:toggleFn(filter)
	else
		return
	end
end

local function modeClass()
	local Mode = {
		id = "Mode",
		globalValue = false,
		toggleFn = nil,
		activeBuffers = {},
	}
	Mode.__index = Mode

	function Mode:toggle(filter)
		if not filter then
			handleGlobalToggle(self)
		else
			handleToggleWithFilter(self, filter)
		end
	end

	function Mode:isActive(filter)
		if not filter then
			return self.globalValue
		else
			return self.activeBuffers[filter.buffer]
		end
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

function M.getBufferActiveModesIcons(bufnr)
	local activeModeIcons = {}
	for _, v in pairs(modeStore) do
		if v.activeBuffers[bufnr] then
			table.insert(activeModeIcons, v.icon)
		end
	end
	return activeModeIcons
end

return M
