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
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'mhinz/vim-startify'
" languages
Plug 'fatih/vim-go', {'for': 'go' }
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}
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
colorscheme onehalfdark
set background=dark
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
set listchars=tab:\|\ ,
set list
hi clear IncSearch
hi link IncSearch StatusLine
hi clear Search
hi link Search StatusLine

" movement
nnoremap j gj
nnoremap k gk

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

" easymotion
map <leader>e <Plug>(easymotion-prefix)
hi EasyMotionTarget ctermfg=1 cterm=bold,underline
hi link EasyMotionTarget2First EasyMotionTarget
hi EasyMotionTarget2Second ctermfg=1 cterm=underline

" lightline
let g:lightline = {
  \   'colorscheme': 'onehalfdark',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ],
  \              [ 'tagbar' ]
  \     ],
  \     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
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
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \  }
let g:lightline.component_type   = {
  \   'buffers': 'tabsel',
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
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


" GitGutter setup
highlight clear SignColumn
" let g:gitgutter_sign_added = '·'
" let g:gitgutter_sign_modified = '·'
" let g:gitgutter_sign_removed = '·'
" let g:gitgutter_sign_removed_first_line = '·'
" let g:gitgutter_sign_modified_removed = '·'

" tagbar
nmap <F9> :TagbarToggle<CR>
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
nnoremap <F8> :NERDTreeToggle<CR>

" fzf
let g:fzf_buffers_jump = 1
nnoremap <Leader>, :Buffer<CR>
nnoremap <Leader>; :Files<CR>
nnoremap <Leader>: :History<CR>

" fugitive
nnoremap <leader>g :<C-u>Gstatus<CR>


" ale
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1
" let g:ale_open_list = 1
nmap <silent> <leader>n <Plug>(ale_next_wrap)
nmap <silent> <leader>p <Plug>(ale_previous_wrap)

" neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre *.go Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
augroup END
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']

" custom syntax
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.cuh set ft=cuda
au BufNewFile,BufRead *.go set ft=go

" golang
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go nmap <C-n><C-g> :GoDef<CR>
au FileType go nmap <C-n><C-r> :GoReferrers<CR>
let g:go_list_type = "quickfix"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_autosave = 0


" typescript
let b:ale_linters = {'typescript': ['tslint']}
au FileType typescript nmap <C-n><C-g> :TSDef<CR>
au FileType typescript nmap <C-n><C-r> :TSRefs<CR>
au FileType typescript.tsx nmap <C-n><C-g> :TSDef<CR>
au FileType typescript.tsx nmap <C-n><C-r> :TSRefs<CR>

