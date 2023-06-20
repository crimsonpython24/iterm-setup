package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/luasnip/tex/?.lua"
local n = require("imports")
local xx = require("test_import")

xx.xx()

return {
	-- Example: how to set snippet parameters
	require("luasnip").snippet({ -- Table 1: snippet parameters
		trig = ";hey",
		dscr = "An autotriggering snippet that expands 'hi' into 'Hello, world!'",
		regTrig = false,
		priority = 100,
		snippetType = "autosnippet",
	}, { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
		n.t("Hello, world!"), -- A single text node
	}),
}
