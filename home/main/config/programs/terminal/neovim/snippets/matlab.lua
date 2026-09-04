local ls = require("luasnip")
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	ls.snippet(
		{ trig = "plot", name = "Plot", condition = line_begin },
		fmt([[plot({},{},'Color',{},'Linewidth',1.5,'MarkerSize',0,'DisplayName',"{}")]], { i(1), i(2), i(3), i(4) })
	),
}
