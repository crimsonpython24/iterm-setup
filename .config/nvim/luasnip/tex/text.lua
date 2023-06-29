package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/luasnip/tex/?.lua"
local imp = require("_imports")

return {
	imp.s({
		trig = ";bo",
		snippetType = "autosnippet",
	}, imp.fmta("\\textbf{<>}", { imp.i(1) })),
	imp.s({
		trig = ";un",
		snippetType = "autosnippet",
	}, imp.fmta("\\underline{<>}", { imp.i(1) })),
	imp.s({
		trig = ";ta",
		snippetType = "autosnippet",
	}, imp.fmta("\\textit{<>}", { imp.i(1) })),
	imp.s({
		trig = ";tra",
		snippetType = "autosnippet",
	}, {
		imp.t("\\textrightarrow"),
	}),
	imp.s({
		trig = ";tla",
		snippetType = "autosnippet",
	}, {
		imp.t("\\textleftarrow"),
	}),
}
