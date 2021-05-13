"INI .vimrc
set rtp+=/home/wvovaw/.vim/bundle/Vundle.vim

set t_Co=256
set encoding=UTF-8
set mouse=n
set autoindent
set cindent
set et 
set sts=2
set sw=2 
set tw=80
set showtabline=2
set noshowmode
set rnu nu

call vundle#begin()
Plugin 'gmarik/Vundle.vim' "!!!Vundle plugin manager!!!
Plugin 'junegunn/fzf', {'do': { -> fzf#install() } } " FZF
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'Xuyuanp/nerdtree-git-plugin' " Add git interraction to neardtree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight nerdtree
" Plugin 'benmills/vimux' "Tmux integration. Try Vimux in command mode
Plugin 'tpope/vim-fugitive' "Ultimate git helper
Plugin 'tpope/vim-commentary' "Comment/uncomment lines with gcc or gc in visual mode
Plugin 'dracula/vim', { 'name': 'dracula' } "Dracula theme 
Plugin 'arcticicestudio/nord-vim' " Nord theme
Plugin 'altercation/vim-colors-solarized' " Solarized
Plugin 'morhetz/gruvbox' " Gruuuuuuvboooox
Plugin 'tomasiser/vim-code-dark' " Code colorscheme
Plugin 'ryanoasis/vim-devicons' "NerdFont for vim and NerdTree
Plugin 'vim-airline/vim-airline' "Statusline mod
Plugin 'vim-airline/vim-airline-themes' "And themes
"Plugin 'Valloric/YouCompleteMe' "Code completer for many languages
Plugin 'vim-python/python-syntax' "Python syntax highlighting
Plugin 'sheerun/vim-polyglot' "Syntax highlighting for almost everything
Plugin 'neoclide/coc.nvim', {'branch': 'release'} " Vim becomves smarter
Plugin 'airblade/vim-gitgutter' " Show line changes 
Plugin 'mhinz/vim-startify' " Vim start winow
Plugin 'machakann/vim-highlightedyank' " Highlight yunked text
Plugin 'wsdjeg/vim-todo' " Todo manager BROKEN (Fixed)
Plugin 'chrisbra/colorizer' " Colorize hex colors
Plugin 'fatih/vim-go' " Go utils
Plugin 'editorconfig/editorconfig-vim'
" Plugin 'Raimondi/delimitMate' " Doesn't work
Plugin 'jiangmiao/auto-pairs' " Braces control
Plugin 'posva/vim-vue' " VUE js 
call vundle#end()

"""Includes
so ~/.cocrc.vim
so ~/.startifyrc.vim
"""

"""Mappings
nmap <silent> <leader>w :tabnew<cr>
nmap <leader>k :OneBuf<cr>
nmap <silent> <leader>o :OpenTodo<cr>
nmap <silent> <leader>h :noh<cr>
nmap <Leader>y "+y
nmap <Leader>Y "+Y
nmap <Leader>p "+p
nmap <Leader>P "+P
map <silent> <Leader>n :set nornu nonu<cr>
map <silent> <Leader>N :set nu rnu<cr>
"""

"""NERDtree stuf
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR> 
"""FZF stuf
map <C-p> :FZF<CR> 
"""

"""Commands
command! OneBuf execute '%bd|edit #|normal `"'
au BufNewFile,BufRead *.ejs set filetype=html
"""

"""YunkHighlight stuf
let g:highlightedyank_highlight_duration = 1000
"""

"Vim theme stuf
" colorscheme dracula 
" colorscheme solarized
" colorscheme nord
colorscheme codedark

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = '1'
" let g:italicize_strings = '1'
"

"""Airline stuf
"Theme
" let g:airline_theme = 'dracula'
" let g:airline_theme = 'gruvbox'
let g:airline_theme = 'codedark'
" let g:airline_theme = 'solarized'
"Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = "\uE0B4"
let g:airline#extensions#tabline#left_alt_sep = "\uE0B5"
let g:airline#extensions#tabline#right_sep = "\uE0B6"
let g:airline#extensions#tabline#right_alt_sep = "\uE0B7"

"Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:webdevicons_enable_airline_statusline = 1 " Enable to statusline
let g:webdevicons_enable_ctrlp = 1  " Enable for CtrlP
" :echo WebDevIconsGetFileTypeSymbol(expand('%:t'))
let g:airline_section_x = '%{airline#util#wrap(airline#parts#filetype(),1)}%{" "}%{WebDevIconsGetFileTypeSymbol()}' " Add glyph after filetype
"""
