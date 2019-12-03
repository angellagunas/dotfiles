set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-pathogen'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'dense-analysis/ale'

Plugin 'jiangmiao/auto-pairs'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" JS PLUGINS
Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" color schema
Plugin 'mhartington/oceanic-next'
Plugin 'ryanoasis/vim-devicons'

Plugin 'Shougo/unite'

set runtimepath^=~/.vim/bundle/ctrlp.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required

" CONFIGURATIONS

" Color scheme
syntax enable
colorscheme OceanicNext

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" Line counter
set number
" No wrap
set nowrap
set encoding=UTF-8

if (has("termguicolors"))
  set termguicolors
endif

" set up indentation
filetype plugin indent on
" set list
" set listchars=tab:›-,space:·
" highlight SpecialKey ctermfg=237
" highlight SpecialKey ctermbg=NONE

" Highlight search matches
set hlsearch

" Highlight current row
set cursorline

" avoid navigation keys
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>

" NerdTree confs
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0

"YouAutocompleteMe
let g:ycm_confirm_extra_conf = 0
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1  }

" Emmet configurations
let g:user_emmet_install_global = 0
autocmd FileType html*,css* EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" Syntastic confs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Allow mouse usage
" set mouse=a

" Syntastic confs
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

" To install 'pip install flake8' is required
" Python configurations are in ftplugin/python.vim

" To install 'sudo 'npm install -g jslint' is required
" let g:syntastic_javascript_checkers = ['jslint', ]

""Hightlight matches
set hlsearch

execute pathogen#infect()

" Shortcuts
silent! nmap <F2> :NERDTreeToggle<CR>
map <F3> :vsp<CR>
map <F4> :sp<CR>

""Toggle comments as a block
nmap <C-C> :TCommentBlock<CR>
vmap <C-C> :TCommentBlock<CR>

"Configuring ctrl p to avoid to clear cache on exit
let g:ctrlp_clear_cache_on_exit = 0


" Auto turn on paste mode, when pasting in insert mode.
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"" Multiple cursor settings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" ALE
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint', 'prettier'], 'typescript': ['prettier', 'tslint']}
" pip install black
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['isort', 'black']}
let g:ale_fix_on_save = 1

" CONFIG JS FORMAT
let g:prettier#autoformat = 0
" let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'

" JS Linter
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

let g:airline_theme='oceanicnext'

set guifont=DroidSansMono\ Nerd\ Font\ 11
