" Basic Settings {{{


" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Set encoding utf
set encoding=UTF-8

" Set font for nerd tree
set guifont=Hack:h11

" Turn syntax highlighting on.
syntax on


" Add numbers to each line on the left-hand side.
set number


" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Show hybrid line number
set number relativenumber

" Fix for backspace not working in insert  mode
set backspace=indent,eol,start
" Set color scheme
set background=dark
if (has("termguicolors"))
  set termguicolors
 endif
colorscheme oceanic_material

" Setting requred for switching cursor style withour any delay
 set ttimeout
 set ttimeoutlen=1
 set ttyfast

 " Set refresh time to detect git content change
 set updatetime=250


" }}}



" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" Have nerdtree ignore certain files and directories.

" vim devi icons settings
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1



" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" The amount of space to use after the glyph character in vim-airline tabline(default '')
let g:WebDevIconsTabAirLineAfterGlyphPadding = ' '

" The amount of space to use before the glyph character in vim-airline tabline(default ' ')
let g:WebDevIconsTabAirLineBeforeGlyphPadding = ' '

let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" Enable linter
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['jsonlint'],
\}
let g:ale_set_highlights = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_highlight_linenrs = 1
" Show number of errors and warnings on status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
"gutter settings
"Enable git gutter
let g:gitgutter_enabled = 1

" Show git status at status line
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
" Nerd tree setting

let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" git nerd tree
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

let mapleader = " "

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" System clipeboard mapping
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

" Other settings --------------------------------------------------------- {{{

" Show vertical line and block cursor in insert and normal mode respectively
 let &t_SI = "\<Esc>]50;CursorShape=1\x7"
 let &t_SR = "\<Esc>]50;CursorShape=2\x7"
 let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" }}}

