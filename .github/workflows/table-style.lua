-- table-style.lua
-- Pandoc Lua filter to add blue header row and borders to tables

function Table(tbl)
  if FORMAT:match 'latex' then
    -- Inject LaTeX to style the first row as blue with white text
    -- and add vertical borders
    
    local cols = #tbl.colspecs
    local col_spec = "|"
    for i = 1, cols do
      col_spec = col_spec .. "l|"
    end
    
    -- Build custom LaTeX table
    local latex_pre = string.format([[
\begingroup
\setlength{\tabcolsep}{8pt}
\renewcommand{\arraystretch}{1.5}
\arrayrulecolor[HTML]{9CC2E5}
\begin{tabular}{%s}
\hline
\rowcolor[HTML]{2E75B6}
]], col_spec)

    local latex_post = [[
\hline
\end{tabular}
\endgroup
]]
    
    -- Return modified table
    return {
      pandoc.RawBlock('latex', latex_pre),
      tbl,
      pandoc.RawBlock('latex', latex_post)
    }
  end
  return tbl
end
