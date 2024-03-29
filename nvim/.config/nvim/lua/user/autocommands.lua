--vim.cmd [[
  --augroup _general_settings
    --autocmd!
    --autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    --autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    --autocmd BufWinEnter * :set formatoptions-=cro
    --autocmd FileType qf set nobuflisted
  --augroup end

  --augroup _git
    --autocmd!
    --autocmd FileType gitcommit setlocal wrap
    --autocmd FileType gitcommit setlocal spell
  --augroup end

  --augroup _markdown
    --autocmd!
    --autocmd FileType markdown setlocal wrap
    --autocmd FileType markdown setlocal spell
  --augroup end

  --augroup _auto_resize
    --autocmd!
    --autocmd VimResized * tabdo wincmd =
  --augroup end

  --]]

-- NOTE: glh (shader header), vsh(vertex shader header) and fsh(frag shader header) are special
-- extensions used for shader resource system in Villain engine
vim.cmd [[
    augroup _mark_more_glsl_filetypes
        autocmd BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag,*.glh,*.vsh,*.fsh set ft=glsl
    augroup end

    augroup _remove_trailing_whitespace
        autocmd BufWritePre * :%s/\s\+$//e
    augroup end

    augroup _hide_bufferline_on_alpha
        autocmd!
        autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    augroup end

    augroup _format_tf
        autocmd!
        autocmd FileType terraform autocmd BufWritePre <buffer> :TerraformFmt
    augroup end
]]
-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
