local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	-- ============== Figures ==============
	s(
		{ trig = "svgfig", name = "Figures from inkscape PDF+PDF_tex", condition = line_begin },
		fmt(
			[[
\begin{{figure}}[htbp]
	\centering
	\def\svgwidth{{0.99\textwidth}}
	\import{{figures/{}.pdf_tex}}
	\caption{{{}}}
	\label{{{}}}
\end{{figure}}
]],
			{ i(1), i(2), rep(1) }
		)
	),

	s(
		{ trig = "sfig", name = "Single figure", condition = line_begin },
		fmt(
			[[
\begin{{figure}}[htbp]
	\centering
	\input{{figures/{}}}
	\caption{{{}}}
	\label{{{}}}
\end{{figure}}
]],
			{ i(1), i(2), rep(1) }
		)
	),

	s(
		{ trig = "dfig", name = "Double figures", condition = line_begin },
		fmt(
			[[
\begin{{figure}}
	\begin{{subfigure}}{{\dfigsize}}
		\centering
		\includegraphics[width=\textwidth]{{figures/{}}}
		\caption{{{}}}
		\label{{fig:{}}}
	\end{{subfigure}}
	\hfill
	\begin{{subfigure}}{{\dfigsize}}
		\centering
		\includegraphics[width=\textwidth]{{figures/{}}}
		\caption{{{}}}
		\label{{fig:{}}}
	\end{{subfigure}}
	\caption{{{}}}
\end{{figure}}
]],
			{ i(2), i(1), rep(2), i(4), i(3), rep(4), i(5) }
		)
	),

	s(
		{ trig = "tab", name = "Table", condition = line_begin },
		fmt(
			[[
\begin{{table}}
	\centering
	\begin{{tabular}}{{{}}}
		\hline
		{} &  &  &  \\ \hline
	\end{{tabular}}
	\caption{{{}}}
	\label{{table:{}}}
\end{{table}}
]],
			{ i(1), i(4), i(2), i(3) }
		)
	),

	-- ============== Basics ==============
	s("env", fmt("\\begin{{{}}}\n\t{}\n\\end{{{}}}", { i(1), i(2), rep(1) }, { name = "Environment" })),

	-- ============== Direct env ==============
	s(
		{ trig = "abs", name = "Abstract", condition = line_begin },
		fmt("\\begin{{abstract}}\n\t{}\n\\end{{abstract}}", { i(1) })
	),

	s(
		{ trig = "itm", name = "Environnement itemize", condition = line_begin },
		fmt("\\begin{{{}}}\n\t\\item {}\n\\end{{{}}}", { i(1, "itemize"), i(2), rep(1) })
	),

	s({ trig = "it", name = "Add item", condition = line_begin }, fmt("\t\\item {}", { i(1) })),

	-- ============== Section ==============
	s("sec", fmt("\\{}{{{}}}\\label{{sec:{}}}", { i(1), i(2), i(3) }, { name = "sections" })),

	-- ============== Disp ==============
	s("bold", fmt("\\textbf{{{}}}", { i(1) }, { name = "bold" })),
	s("ital", fmt("\\textit{{{}}}", { i(1) }, { name = "italique" })),
	s("smcap", fmt("\\textsc{{{}}}", { i(1) }, { name = "small caps" })),
	s("_", fmt("_{{{}}}", { i(1) }, { name = "undertext" })),
	s("^", fmt("^{{{}}}", { i(1) }, { name = "uptext" })),

	-- ============== Maths ==============
	s("frac", fmt("\\frac{{{}}}{{{}}}", { i(1), i(2) }, { name = "fraction" })),
	s("cases", fmt("\\begin{{cases}}\n\t{}\n\\end{{cases}}", { i(1) }, { name = "cases" })),

	s(
		{ trig = "eq", name = "Equation", condition = line_begin },
		fmt("\\begin{{equation}}\n\t{}\n\t\\label{{eq:{}}}\n\\end{{equation}}", { i(1), i(2) })
	),

	s(
		{ trig = "param", name = "Parameters", condition = line_begin },
		fmt("\\begin{{parameters}}\n\t{}\t& {}\t\n\\end{{parameters}}", { i(1), i(2) })
	),

	s(
		{ trig = "align", name = "Align", condition = line_begin },
		fmt("\\begin{{align}}\n\t{}\n\t\\label{{eq:{}}}\n\\end{{align}}", { i(1), i(2) })
	),

	s(
		{ trig = "mat", name = "Matrix", condition = line_begin },
		fmt("\\begin{{bmatrix}}\n\t{}\n\\end{{bmatrix}}", { i(1) })
	),

	-- ============== Citation ==============
	s("ref", fmt("\\ref{{{}}}", { i(1) }, { name = "reference" })),
	s("cite", fmt("\\cite{{{}}}", { i(1) }, { name = "citation" })),

	-- ============== Siunitx ==============
	s("num", fmt("\\num{{{}}}", { i(1) }, { name = "Number" })),
	s("un", fmt("\\unit{{{}}}", { i(1) }, { name = "Unit" })),
	s("quant", fmt("\\qty{{{}}}{{{}}}", { i(1), i(2) }, { name = "Quantity" })),
	s("ptm", t("\\ptm")),
}
