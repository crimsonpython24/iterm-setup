package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/luasnip/tex/?.lua"
local imp = require("_imports")

return {
	imp.s({
		trig = ";rgr",
		snippetType = "autosnippet",
	}, {
		imp.t("\\raggedright"),
	}),
	imp.s({
		trig = ";rgl",
		snippetType = "autosnippet",
	}, {
		imp.t("\\raggedleft"),
	}),
	imp.s({
		trig = ";rgb",
		snippetType = "autosnippet",
	}, {
		imp.t("\\raggedbottom"),
	}),
	imp.s(
		{
			trig = ";fig",
			snippetType = "autosnippet",
		},
		imp.fmta(
			[[
				\begin{figure}[htbp!]
					<>
				\end{figure}
			]],
			{ imp.i(1) }
		)
	),
	imp.s(
		{
			trig = ";img",
			snippetType = "autosnippet",
		},
		imp.fmta(
			[[
				\beginf\centering
					\includegraphics[scale=<>]{<>} 
				\endf
			]],
			{ imp.i(1), imp.i(2) }
		)
	),
}
