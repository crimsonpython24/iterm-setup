local setup, mini_pairs = pcall(require, "mini.pairs")
if not setup then
	print("Mini.pairs not installed!")
	return
end

mini_pairs.setup()
