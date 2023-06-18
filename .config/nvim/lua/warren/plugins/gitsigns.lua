local status, gitsigns = pcall(require, "gitsigns")
if not status then
	print("Gitsigns not installed!")
	return
end

gitsigns.setup()
