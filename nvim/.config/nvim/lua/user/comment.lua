local m = {}

m.setup = function()
	local status_ok, comment = pcall(require, "Comment")
	if not status_ok then
		return
	end
  comment.setup()
end

return m
