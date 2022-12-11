local m = {}

m.setup = function()
	local status_ok, session = pcall(require, "auto-session")
	if not status_ok then
		return
	end
	session.setup({
		log_level = "error",
		auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	})
end

return m
