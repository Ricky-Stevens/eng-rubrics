-- table-style.lua
-- Replaces Pandoc tables with custom styled LaTeX tables
-- Blue header row, vertical borders, proper cell padding

function Table(tbl)
  if not FORMAT:match('latex') then
    return tbl
  end

  -- Count columns
  local num_cols = #tbl.colspecs
  
  -- Build column spec with vertical borders: |l|l|l|l|l|l|
  local colspec = "|"
  for i = 1, num_cols do
    colspec = colspec .. "l|"
  end

  -- Start building LaTeX
  local latex_lines = {}
  
  -- Preamble with styling
  table.insert(latex_lines, "\\begin{table}[H]")
  table.insert(latex_lines, "\\centering")
  table.insert(latex_lines, "\\renewcommand{\\arraystretch}{1.8}")
  table.insert(latex_lines, "\\setlength{\\tabcolsep}{12pt}")
  table.insert(latex_lines, "\\arrayrulecolor{borderblue}")
  table.insert(latex_lines, "\\begin{tabular}{" .. colspec .. "}")
  table.insert(latex_lines, "\\hline")
  
  -- Header row with blue background
  if tbl.head and tbl.head.rows and #tbl.head.rows > 0 then
    table.insert(latex_lines, "\\rowcolor{tablebg}")
    local header_cells = {}
    for _, row in ipairs(tbl.head.rows) do
      for _, cell in ipairs(row.cells) do
        local cell_text = pandoc.utils.stringify(cell.contents)
        table.insert(header_cells, "\\textcolor{white}{\\textbf{" .. cell_text .. "}}")
      end
    end
    table.insert(latex_lines, table.concat(header_cells, " & ") .. " \\\\")
    table.insert(latex_lines, "\\hline")
  end
  
  -- Body rows
  if tbl.bodies then
    for _, body in ipairs(tbl.bodies) do
      for _, row in ipairs(body.body) do
        local row_cells = {}
        for _, cell in ipairs(row.cells) do
          local cell_text = pandoc.utils.stringify(cell.contents)
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
