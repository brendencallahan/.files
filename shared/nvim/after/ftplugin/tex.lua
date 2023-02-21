vim.wo.foldexpr = 'vimtex#fold#level(v:lnum)'
vim.wo.foldtext = 'vimtex#fold#text()'

-- vim.cmd[[
-- nmap <leader>ll :w<cr> :!pdflatex %:r.tex && bibtex %:r.aux && pdflatex %:r.tex && pdflatex %:r.tex && rm %:r.aux %:r.log %:r.blg %:r.bbl<cr>
-- ]]
--
-- vim.cmd[[
-- nmap <leader>lv :!zathura %:r.pdf > /dev/null 2>&1 &<cr><cr>
-- ]]
