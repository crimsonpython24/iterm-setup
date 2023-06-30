package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/luasnip/tex/?.lua"
local imp = require("_imports")

return {
	imp.s({
		trig = ";sec",
		snippetType = "autosnippet",
	}, imp.fmta("\\section{<>}", { imp.i(1) })),
	imp.s({
		trig = ";usec",
		snippetType = "autosnippet",
	}, imp.fmta("\\section*{<>}", { imp.i(1) })),
	imp.s({
		trig = ";sub",
		snippetType = "autosnippet",
	}, imp.fmta("\\subsection{<>}", { imp.i(1) })),
	imp.s({
		trig = ";usub",
		snippetType = "autosnippet",
	}, imp.fmta("\\subsection*{<>}", { imp.i(1) })),
	imp.s({
		trig = ";vsub",
		snippetType = "autosnippet",
	}, imp.fmta("\\setlength{\\parskip}{-3pt}\\subsection*{<>}", { imp.i(1) })),
	imp.s(
		{
			trig = ";impt",
			snippetType = "autosnippet",
		},
		imp.t({
			"\\usepackage{amsmath}",
			"\\usepackage[a4paper, margin=1in]{geometry}",
			"\\usepackage{graphicx}",
			"\\usepackage{setspace}",
			"\\usepackage{enumitem}",
			"\\usepackage{setspace}",
			"\\usepackage{array}",
			"\\usepackage{enumitem}",
			"\\usepackage{calc}",
			"\\usepackage{changepage}",
			"\\usepackage{tabularx}",
		})
	),
}
