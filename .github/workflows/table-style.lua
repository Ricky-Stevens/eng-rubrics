-- table-style.lua
-- Replaces Pandoc tables with custom styled LaTeX tables
-- Pale blue header row, black borders, proper cell padding

-- Escape special LaTeX characters
local function escape_latex(text)
  -- Escape & which is a column separator in LaTeX tables
  text = text:gsub("&", "\\&")
  -- Escape other special chars if needed
  text = text:gsub("%%", "\\%%")
  text = text:gsub("#", "\\#")
  return text
end

function Table(tbl)
  if not FORMAT:match('latex') then
    return tbl
  end

  -- Count columns from colspecs
  local num_cols = #tbl.colspecs
  
  -- Build column spec with vertical borders
  local colspec = "|"
  for i = 1, num_cols do
    colspec = colspec .. "l|"
  end

  -- Start building LaTeX
  local latex_lines = {}
  
  -- Preamble with styling
  table.insert(latex_lines, "\\begin{table}[H]")
  table.insert(latex_lines, "\\centering")
  table.insert(latex_lines, "\\renewcommand{\\arraystretch}{2.0}")
  table.insert(latex_lines, "\\setlength{\\tabcolsep}{12pt}")
  table.insert(latex_lines, "\\arrayrulecolor{black}")
  table.insert(latex_lines, "\\begin{tabular}{" .. colspec .. "}")
  table.insert(latex_lines, "\\hline")
  
  -- Header row with pale blue background, black bold text, larger font
  if tbl.head and tbl.head.rows and #tbl.head.rows > 0 then
    for _, row in ipairs(tbl.head.rows) do
      local header_cells = {}
      for i = 1, num_cols do
        local cell = row.cells[i]
        local cell_text = ""
        if cell then
          cell_text = escape_latex(pandoc.utils.stringify(cell.contents))
        end
        table.insert(header_cells, "\\large\\textbf{" .. cell_text .. "}")
      end
      table.insert(latex_lines, "\\rowcolor{tableheaderbg}" .. table.concat(header_cells, " & ") .. " \\\\")
    end
    table.insert(latex_lines, "\\hline")
  end
  
  -- Body rows
  if tbl.bodies then
    for _, body in ipairs(tbl.bodies) do
      for _, row in ipairs(body.body) do
        local row_cells = {}
        for i = 1, num_cols do
          local cell = row.cells[i]
          local cell_text = ""
          if cell then
            cell_text = escape_latex(pandoc.utils.stringify(cell.contents))
          end
          table.insert(row_cells, cell_text)
        end
        table.insert(latex_lines, table.concat(row_cells, " & ") .. " \\\\")
        table.insert(latex_lines, "\\hline")
      end
    end
  end
  
  -- Close table
  table.insert(latex_lines, "\\end{tabular}")
  table.insert(latex_lines, "\\end{table}")
  
  return pandoc.RawBlock('latex', table.concat(latex_lines, "\n"))
end
