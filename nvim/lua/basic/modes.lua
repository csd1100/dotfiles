local utils = require("basic.utils")
local M = {}

local Modes = {}
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

local function handleToggleWithOptions(mode, opts)
	if not mode.globalValue then
		addToActiveBuffers(mode, opts.buffer)
		mode:toggleFn(opts)
	else
		return
	end
end

function M.getModeClass()
	local Mode = {
		id = "Mode",
		globalValue = false,
		toggleFn = nil,
		activeBuffers = {},
	}
	Mode.__index = Mode

	function Mode:toggle(opts)
		if not opts then
			handleGlobalToggle(self)
		else
			handleToggleWithOptions(self, opts)
		end
	end

	function Mode:isActive(bufnr)
		if not bufnr then
			return self.globalValue
		else
			return self.activeBuffers[bufnr]
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
		Modes[this.id] = this
		return this
	end

	return Mode
end

function M.getMode(id)
	return Modes[id]
end

function M.getGlobalActiveModes()
	local activeModes = {}
	for _, v in pairs(globalActiveModes) do
		table.insert(activeModes, v.id)
	end
	return activeModes
end

function M.getGlobalActiveModesIcons()
	local activeModeIcons = {}
	for _, v in pairs(globalActiveModes) do
		table.insert(activeModeIcons, v.icon)
	end
	return activeModeIcons
end

function M.getBufferActiveModes(bufnr)
	local activeModes = {}
	for _, v in pairs(Modes) do
		if v.activeBuffers[bufnr] then
			table.insert(activeModes, v.id)
		end
	end
	return activeModes
end

function M.getBufferActiveModesIcons(bufnr)
	local activeModeIcons = {}
	for _, v in pairs(Modes) do
		if v.activeBuffers[bufnr] then
			table.insert(activeModeIcons, v.icon)
		end
	end
	return activeModeIcons
end

return M
