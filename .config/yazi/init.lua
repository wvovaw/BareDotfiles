function Manager:render(area)
	local chunks = self:layout(area)

	local bar = function(c, x, y)
		x, y = math.max(0, x), math.max(0, y)
		return ui.Bar(ui.Rect { x = x, y = y, w = ya.clamp(0, area.w - x, 1), h = math.min(1, area.h) }, ui.Bar.TOP):symbol(c)
	end

 	return ya.flat {
 		-- Borders
		ui.Border(area, ui.Border.ALL):type(ui.Border.ROUNDED),
		ui.Bar(chunks[1], ui.Bar.RIGHT),
		ui.Bar(chunks[3], ui.Bar.LEFT),

		bar("┬", chunks[1].right - 1, chunks[1].y),
		bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
		bar("┬", chunks[2].right, chunks[2].y),
		bar("┴", chunks[2].right, chunks[1].bottom - 1),

 		-- Parent
		Parent:render(chunks[1]:padding(ui.Padding.xy(1))),
 		-- Current
		Current:render(chunks[2]:padding(ui.Padding.y(1))),
 		-- Preview
		Preview:render(chunks[3]:padding(ui.Padding.xy(1))),
 	}
end

-- Status line (bottom)
function Status:name()
	local h = cx.active.current.hovered
	if not h then
		return ui.Span("")
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Span(" " .. h.name .. linked .. " ")
end
function Status:size()
	local h = cx.active.current.hovered
	if not h then
		return ui.Line {}
	end

	local style = self.style()
	return ui.Span(" [ " .. ya.readable_size(h:size() or h.cha.length) .. " ] ")
end
function Status:permissions()
	local h = cx.active.current.hovered
	if not h then
		return ui.Line {}
	end

	local perm = h.cha:permissions()
	if not perm then
		return ui.Line {}
	end

	local spans = {}
	spans[1] = ui.Span(" [ ")
	for i = 2, #perm do
		local c = perm:sub(i, i)
		local style = THEME.status.permissions_t
		if c == "-" then
			style = THEME.status.permissions_s
		elseif c == "r" then
			style = THEME.status.permissions_r
		elseif c == "w" then
			style = THEME.status.permissions_w
		elseif c == "x" or c == "s" or c == "S" or c == "t" or c == "T" then
			style = THEME.status.permissions_x
		end
		spans[i] = ui.Span(c):style(style)
	end
	spans[#spans] = ui.Span(" ] ")
	return ui.Line(spans)
end
function Status:position()
	local cursor = cx.active.current.cursor
	local length = #cx.active.current.files

	local style = self.style()

	return ui.Span(" [ " .. string.format("%2d/%-2d", cursor + 1, length).. " ] ")
end
function Status:render(area)
	self.area = area

	local left = ui.Line { self:name() }
	local right = ui.Line { self:size(), self:permissions(), self:position() }
	return {
		ui.Paragraph(area, { left }),
		ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
		table.unpack(Progress:render(area, right:width())),
	}
end

