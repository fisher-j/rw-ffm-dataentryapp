let SessionLoad = 1
let s:cpo_save=&cpo
set cpo&vim
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <Plug>(snippy-previous) <Cmd>lua require "snippy".previous()
inoremap <Plug>(snippy-next) <Cmd>lua require "snippy".next()
inoremap <Plug>(snippy-expand) <Cmd>lua require "snippy".expand()
inoremap <Plug>(snippy-expand-or-advance) <Cmd>lua require "snippy".expand_or_advance()
imap <Plug>(snippy-expand-or-next) <Plug>(snippy-expand-or-advance)
noremap! <silent> <Plug>luasnip-expand-repeat <Cmd>lua require'luasnip'.expand_repeat()
noremap! <silent> <Plug>luasnip-delete-check <Cmd>lua require'luasnip'.unlink_current_if_deleted()
inoremap <silent> <Plug>luasnip-jump-prev <Cmd>lua require'luasnip'.jump(-1)
inoremap <silent> <Plug>luasnip-jump-next <Cmd>lua require'luasnip'.jump(1)
inoremap <silent> <Plug>luasnip-prev-choice <Cmd>lua require'luasnip'.change_choice(-1)
inoremap <silent> <Plug>luasnip-next-choice <Cmd>lua require'luasnip'.change_choice(1)
inoremap <silent> <Plug>luasnip-expand-snippet <Cmd>lua require'luasnip'.expand()
inoremap <silent> <Plug>luasnip-expand-or-jump <Cmd>lua require'luasnip'.expand_or_jump()
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path('dir /s/b/a:-d')
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path('dir /s/b')
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <C-S> u[s1z=`]au
inoremap <C-L> l
inoremap <C-K> k
inoremap <C-J> j
inoremap <C-H> h
inoremap <C-W> u
inoremap <C-U> u
nnoremap  h
tnoremap  h
nnoremap <NL> j
tnoremap <NL> j
nnoremap  k
tnoremap  k
tnoremap  l
nnoremap  l
nnoremap  [s1z=``
xmap  x <Plug>(snippy-cut-text)
nmap  x <Plug>(snippy-cut-text)
nnoremap  q <Cmd>lua vim.diagnostic.setloclist()
nnoremap  e <Cmd>lua vim.diagnostic.open_float()
nnoremap <silent>  ? <Cmd>lua require('telescope.builtin').oldfiles()
nnoremap <silent>  so <Cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }
nnoremap <silent>  sp <Cmd>lua require('telescope.builtin').live_grep()
nnoremap <silent>  sd <Cmd>lua require('telescope.builtin').grep_string()
nnoremap <silent>  sh <Cmd>lua require('telescope.builtin').help_tags()
nnoremap <silent>  sb <Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()
nnoremap <silent>  sf <Cmd>lua require('telescope.builtin').find_files({previewer = false})
nnoremap <silent>    <Cmd>lua require('telescope.builtin').buffers()
tnoremap   
nnoremap  kk :lua rmd_render()
nnoremap  <F1> :Telescope help_tags
noremap <silent>   <Nop>
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap ( (zz
nnoremap ) )zz
nnoremap * *N
xnoremap * y/\V"
nnoremap N Nzz
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()
xmap a% <Plug>(MatchitVisualTextObject)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
nnoremap <silent> <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <silent> <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap n nzz
nnoremap { {zz
nnoremap } }zz
nnoremap <F9> gtipython -m dataentryapp
nnoremap <F10> :sp:te:res 11icd ..python -m dataentryapp
nnoremap <F12> :NvimTreeToggle
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
xnoremap <Plug>(snippy-cut-text) <Cmd>call snippy#cut_text(mode(), v:true)
nnoremap <Plug>(snippy-cut-text) <Cmd>set operatorfunc=snippy#cut_textg@
snoremap <Plug>(snippy-previous) <Cmd>lua require "snippy".previous()
snoremap <Plug>(snippy-next) <Cmd>lua require "snippy".next()
snoremap <Plug>(snippy-expand-or-advance) <Cmd>lua require "snippy".expand_or_advance()
smap <Plug>(snippy-expand-or-next) <Plug>(snippy-expand-or-advance)
snoremap <silent> <Plug>luasnip-jump-prev <Cmd>lua require'luasnip'.jump(-1)
snoremap <silent> <Plug>luasnip-jump-next <Cmd>lua require'luasnip'.jump(1)
snoremap <silent> <Plug>luasnip-prev-choice <Cmd>lua require'luasnip'.change_choice(-1)
snoremap <silent> <Plug>luasnip-next-choice <Cmd>lua require'luasnip'.change_choice(1)
snoremap <silent> <Plug>luasnip-expand-snippet <Cmd>lua require'luasnip'.expand()
snoremap <silent> <Plug>luasnip-expand-or-jump <Cmd>lua require'luasnip'.expand_or_jump()
noremap <silent> <Plug>luasnip-expand-repeat <Cmd>lua require'luasnip'.expand_repeat()
noremap <silent> <Plug>luasnip-delete-check <Cmd>lua require'luasnip'.unlink_current_if_deleted()
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <C-S> [s1z=``
nnoremap <C-K> k
nnoremap <C-J> j
nnoremap <C-H> h
tnoremap <C-L> l
tnoremap <C-K> k
tnoremap <C-J> j
tnoremap <C-H> h
nnoremap <Left> :vert resize -3
nnoremap <Right> :vert resize +3
nnoremap <Down> :resize -3
nnoremap <Up> :resize +3
nnoremap <BS> 
nnoremap <C-L> l
inoremap  h
inoremap <NL> j
inoremap  k
inoremap  l
inoremap  u[s1z=`]au
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set completeopt=menuone,noselect
set gdefault
set helplang=en
set nohlsearch
set ignorecase
set indentkeys=0{,0},0),0],:,!^F,o,O,e,<:>,=elif,=except
set listchars=eol:???,nbsp:+,space:???,tab:>\ ,trail:-
set mouse=a
set operatorfunc=v:lua.require'Comment.api'.locked'toggle.linewise.current'
set runtimepath=~\\AppData\\Local\\nvim,~\\AppData\\Local\\nvim-data\\site,~\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim,c:\\Program\ Files\\NeoVim\\share\\nvim\\runtime,c:\\Program\ Files\\NeoVim\\share\\nvim\\runtime\\pack\\dist\\opt\\matchit,c:\\Program\ Files\\NeoVim\\lib\\nvim,~\\AppData\\Local\\nvim-data\\site/pack/*/start/*,~\\AppData\\Local\\nvim-data\\site/pack/*/start/*\\after,~\\AppData\\Local\\nvim-data\\site\\after,~\\AppData\\Local\\nvim\\after
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal,options
set shiftwidth=2
set smartcase
set spellsuggest=best,9
set splitbelow
set splitright
set statusline=%#Normal#
set termguicolors
set undofile
set updatetime=250
set wildignore=*.pyc
set window=54
set winminheight=0
set winminwidth=0
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/db_learn/dataentryapp
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 frontend/regendataentry.py
badd +420 frontend/fueldataentry.py
badd +117 frontend/mainmenu.py
badd +771 backend/backend.py
badd +171 backend/create_tables.sql
badd +5 ~/AppData/Local/nvim-data/snippets/python.snippets
badd +294 frontend/treedataentry.py
badd +308 frontend/datasheetnamer.py
badd +435 debug_buffer
badd +0 backend/import_from_filename.py
argglobal
%argdel
edit backend/import_from_filename.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 95 + 95) / 191)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 191)
argglobal
balt frontend/fueldataentry.py
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
xnoremap <buffer> <silent> 	 :lua require'nvim-treesitter.incremental_selection'.node_incremental()
xnoremap <buffer> <silent>  :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
nnoremap <buffer> <silent>  so <Cmd>lua require('telescope.builtin').lsp_document_symbols()
nnoremap <buffer> <silent>  ca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> <silent>  rn <Cmd>lua vim.lsp.buf.rename()
nnoremap <buffer> <silent>  D <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> <silent>  wl <Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
nnoremap <buffer> <silent>  wr <Cmd>lua vim.lsp.buf.remove_workspace_folder()
nnoremap <buffer> <silent>  wa <Cmd>lua vim.lsp.buf.add_workspace_folder()
nnoremap <buffer> <silent>  k <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> <silent>  gi <Cmd>lua vim.lsp.buf.implementation()
xnoremap <buffer> <silent> ac :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer', 'x')
onoremap <buffer> <silent> ac :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer', 'o')
xnoremap <buffer> <silent> af :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer', 'x')
onoremap <buffer> <silent> af :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer', 'o')
nnoremap <buffer> <silent> gr <Cmd>lua vim.lsp.buf.references()
nnoremap <buffer> <silent> gd <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> <silent> gD <Cmd>lua vim.lsp.buf.declaration()
xnoremap <buffer> <silent> if :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner', 'x')
onoremap <buffer> <silent> if :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner', 'o')
xnoremap <buffer> <silent> ic :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner', 'x')
onoremap <buffer> <silent> ic :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner', 'o')
nnoremap <buffer> <silent> <F1> <Cmd>lua vim.lsp.buf.hover()
xnoremap <buffer> <silent> <S-Tab> :lua require'nvim-treesitter.incremental_selection'.node_decremental()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal completeslash=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=^\\s*\\(def\\|class\\)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'python'
setlocal filetype=python
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqj
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\(from\\|import\\)
setlocal includeexpr=substitute(substitute(substitute(v:fname,b:grandparent_match,b:grandparent_sub,''),b:parent_match,b:parent_sub,''),b:child_match,b:child_sub,'g')
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,<:>,=elif,=except
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=python3\ -m\ pydoc
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=python3complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=number
setlocal signcolumn=number
setlocal nosmartindent
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_b_command#\ main\ %<%#lualine_c_normal#\ import_from_filename.py\ %#lualine_c_normal#%=%#lualine_c_normal#\ utf-8\ |%#lualine_c_normal#\ dos\ |%#lualine_c_normal#\ python\ %#lualine_b_command#\ 20%%\ %#lualine_a_command#\ \ \ 9:1\ \ 
setlocal suffixesadd=.py
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 9 - ((8 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("backend/backend.py", ":p")) | buffer backend/backend.py | else | edit backend/backend.py | endif
if &buftype ==# 'terminal'
  silent file backend/backend.py
endif
balt backend/create_tables.sql
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
xnoremap <buffer> <silent> 	 :lua require'nvim-treesitter.incremental_selection'.node_incremental()
xnoremap <buffer> <silent>  :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
nnoremap <buffer> <silent>  gi <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> <silent>  k <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> <silent>  wa <Cmd>lua vim.lsp.buf.add_workspace_folder()
nnoremap <buffer> <silent>  wr <Cmd>lua vim.lsp.buf.remove_workspace_folder()
nnoremap <buffer> <silent>  wl <Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
nnoremap <buffer> <silent>  D <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> <silent>  rn <Cmd>lua vim.lsp.buf.rename()
nnoremap <buffer> <silent>  ca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> <silent>  so <Cmd>lua require('telescope.builtin').lsp_document_symbols()
xnoremap <buffer> <silent> ac :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer', 'x')
onoremap <buffer> <silent> ac :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer', 'o')
xnoremap <buffer> <silent> af :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer', 'x')
onoremap <buffer> <silent> af :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer', 'o')
nnoremap <buffer> <silent> gD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> <silent> gd <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> <silent> gr <Cmd>lua vim.lsp.buf.references()
xnoremap <buffer> <silent> if :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner', 'x')
onoremap <buffer> <silent> if :lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner', 'o')
xnoremap <buffer> <silent> ic :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner', 'x')
onoremap <buffer> <silent> ic :lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner', 'o')
nnoremap <buffer> <silent> <F1> <Cmd>lua vim.lsp.buf.hover()
xnoremap <buffer> <silent> <S-Tab> :lua require'nvim-treesitter.incremental_selection'.node_decremental()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal completeslash=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=^\\s*\\(def\\|class\\)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'python'
setlocal filetype=python
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqj
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\(from\\|import\\)
setlocal includeexpr=substitute(substitute(substitute(v:fname,b:grandparent_match,b:grandparent_sub,''),b:parent_match,b:parent_sub,''),b:child_match,b:child_sub,'g')
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,<:>,=elif,=except
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=python3\ -m\ pydoc
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=python3complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=number
setlocal signcolumn=number
setlocal nosmartindent
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statusline=%<%#lualine_c_inactive#\ backend.py\ %#lualine_c_inactive#%=%#lualine_c_inactive#\ 765:9\ \ 
setlocal suffixesadd=.py
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=2147483647
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 765 - ((27 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 765
normal! 09|
wincmd w
exe 'vert 1resize ' . ((&columns * 95 + 95) / 191)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 191)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
set shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
