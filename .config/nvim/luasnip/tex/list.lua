package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/luasnip/tex/?.lua"
local imp = require("_imports")

return {
	imp.s({
		trig = ";ii",
		dscr = "expansion for list item",
		snippetType = "autosnippet",
	}, imp.t("\\item")),
	imp.s({
		trig = ";sl",
		dscr = "set global list spacing, unless stated otherwise",
		snippetType = "autosnippet",
	}, imp.t("\\setlist[itemize]{parsep=0pt}")),
	imp.s(
		{
			trig = ";ss",
			dscr = "creates a top-level list/itemize environment",
			snippetType = "autosnippet",
		},
		imp.fmta(
			[[
				\begin{itemize}
					<>
				\end{itemize}
			]],
			{ imp.i(1) }
		)
	),
	imp.s(
		{
			trig = ";sss",
			dscr = "creates a nested list/itemize environment",
			snippetType = "autosnippet",
		},
		imp.fmta(
			[[
				\begin{itemize}[topsep=0pt, itemsep=0pt, partopsep=0pt]
					<>
				\end{itemize}
			]],
			{ imp.i(1) }
		)
	),
	imp.s(
		{ trig = ";ev", snippetType = "autosnippet" },
		imp.fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{
				imp.i(1),
				imp.i(2),
				imp.rep(1),
			}
		)
	),
}
