" Plugins
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'qpkorr/vim-bufkill'
Plug 'benmills/vimux'
" languages
Plug 'fatih/vim-go', {'for': 'go' }
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}
Plug 'copy/deoplete-ocaml'
call plug#end()
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" General
scriptencoding utf8
set noerrorbells
set splitbelow
set splitright
" set clipboard+=unnamed
set completeopt-=preview
set noshowmode
set ruler
set smartcase
set infercase
set diffopt=filler,vertical
set breakindent
set number
set noexpandtab
set nobackup
set noswapfile
set hlsearch
set incsearch
set backspace=2
set hidden
set undolevels=1000
set noeol
set cursorline
set inccommand=split
set pastetoggle=<F2>
let g:mapleader="\<SPACE>"
" partial command filter on command history
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" display
set updatetime=500
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox
" colorscheme onedark
" let g:onedark_terminal_italics=1
" set background=dark
set foldcolumn=0
set showtabline=0
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=5
set showcmd
set textwidth=80
set fillchars=vert:\│,eob:⌁
set listchars=tab:\|\ ,trail:·,eol:¬,nbsp:_,space:·
set list
hi clear IncSearch
hi link IncSearch StatusLine
hi clear Search
hi link Search StatusLine

" movement
nnoremap j gj
nnoremap k gk

" terminal remapping, reset fzf behavior on escape
tnoremap <Esc> <C-\><C-n>
autocmd! FileType fzf tnoremap <buffer> <Esc> <c-c>

" syntax highlighting
syntax on
filetype plugin indent on
set nomodeline

" auto completion
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay = 50

" search
set ignorecase

" ack
let g:ackprg = 'ag --vimgrep'
cnoreabbrev Ack Ack!
nnoremap <Leader>nf :Ack! 

" easymotion
map <leader>e <Plug>(easymotion-prefix)
hi EasyMotionTarget ctermfg=1 cterm=bold,underline
hi link EasyMotionTarget2First EasyMotionTarget
hi EasyMotionTarget2Second ctermfg=1 cterm=underline

" lightline
let g:lightline = {
  \   'colorscheme': 'gruvbox',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ],
  \              [ 'tagbar' ]
  \     ],
  \     'right': [[ 'linter_errors', 'linter_warnings' ],
  \              [ 'lineinfo' ],
  \              [ 'fileformat', 'fileencoding', 'filetype']]
  \   },
  \   'component': {
  \     'lineinfo': '%3l:%-2v',
  \     'tagbar': '%{tagbar#currenttag("[%s]", "")}',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.tabline = {
  \   'left': [ ['buffers'] ],
  \   'right': [ ]
  \ }
let g:lightline.component_expand = {
  \   'buffers': 'lightline#bufferline#buffers',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors'
  \  }
let g:lightline.component_type   = {
  \   'buffers': 'tabsel',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error'
  \  }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" startify
let g:startify_session_persistence = 1
let g:startify_files_number = 10
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   Recent']         },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
" \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
let g:startify_session_before_save = [
  \ 'echo "Cleaning up before saving.."',
  \ 'silent! NERDTreeTabsClose'
  \ ]

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vc :VimuxInterruptRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>


" GitGutter setup
highlight clear SignColumn
" let g:gitgutter_sign_added = '·'
" let g:gitgutter_sign_modified = '·'
" let g:gitgutter_sign_removed = '·'
" let g:gitgutter_sign_removed_first_line = '·'
" let g:gitgutter_sign_modified_removed = '·'

" tagbar
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" nerdtree
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['node_modules']
nnoremap <Leader>o :NERDTreeToggle<CR>

" fzf
let g:fzf_buffers_jump = 1
nnoremap <Leader>, :Buffer<CR>
nnoremap <Leader>; :Files<CR>
nnoremap <Leader>: :History<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" git (fugitive and fzf commands)
nnoremap <leader>gg :<C-u>Gstatus<CR>
nnoremap <leader>g, :GFiles?<CR>
nnoremap <leader>g; :GFiles<CR>

" enter insert mode in terminal (useful for fugitive)
augroup nvim_term
  au!
  au TermOpen * startinsert
  au TermClose * stopinsert
augroup END

" ale
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
" let g:ale_open_list = 1
nmap <silent> <leader>n <Plug>(ale_next_wrap)
nmap <silent> <leader>p <Plug>(ale_previous_wrap)
let b:ale_linters = {
  \ 'ocaml': ['merlin'],
  \ 'typescript': ['tslint'],
  \ 'typescript.tsx': ['tslint']
  \ }

" neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre *.go Neoformat
  autocmd BufWritePre *.ts,*.tsx Neoformat
  autocmd BufWritePre *.ml,*.mli Neoformat
augroup END
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_ocaml = ['ocamlformat']

" custom syntax
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.cuh set ft=cuda
au BufNewFile,BufRead *.go set ft=go

" ------------- languages -------------
" golang
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go nmap <Leader>nd <Plug>(go-def-split)
au FileType go nmap <Leader>nr :GoReferrers<CR>
" let g:go_list_type = "quickfix"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_autosave = 0
let g:go_gocode_propose_source = 0

" typescript
au FileType typescript,typescript.tsx nmap <Leader>nd :TSDefPreview<CR>
au FileType typescript,typescript.tsx nmap <Leader>nt :TSType<CR>
au FileType typescript,typescript.tsx nmap <Leader>nr :TSRefs<CR>

" ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:merlin_disable_default_keybindings = 1
let g:merlin_split_method = "horizontal" " use never for no split
au FileType ocaml nmap <Leader>nd :MerlinLocate<CR>
au FileType ocaml nmap <Leader>nt :MerlinTypeOf<CR>

