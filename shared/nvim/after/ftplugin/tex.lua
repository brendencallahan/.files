vim.wo.foldexpr = 'vimtex#fold#level(v:lnum)'
vim.wo.foldtext = 'vimtex#fold#text()'

vim.cmd[[inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]]
vim.cmd[[nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]]

-- vim.cmd[[
-- nmap <leader>ll :w<cr> :!pdflatex %:r.tex && bibtex %:r.aux && pdflatex %:r.tex && pdflatex %:r.tex && rm %:r.aux %:r.log %:r.blg %:r.bbl<cr>
-- ]]
--
-- vim.cmd[[
-- nmap <leader>lv :!zathura %:r.pdf > /dev/null 2>&1 &<cr><cr>
-- ]]
