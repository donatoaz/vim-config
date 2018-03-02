call plug#begin()
Plug 'ecomba/vim-ruby-refactoring'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'roman/golden-ratio'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
"Plug 'jparise/vim-graphql'
"Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'gcmt/taboo.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'tmhedberg/matchit'
Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
"Plug 'posva/vim-vue'
Plug 'vim-scripts/The-Nerd-Commenter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
call plug#end()

" Basic Configuration
set nocompatible

" Turns on indentaion based on filetype. we don't like bike shedding, so I am
" keeping this.
filetype plugin indent on
" Enables syntax highlighting
syntax enable
" Sets the font for GUI version of VIm... not sure it if it does anything on the
" terminal version...
set guifont=Menlo\ Regular:h16
" Turns on line numbering
set number
" prevents hidden buffers from being closed. I don't know if I like this or
" not... this is wat is causing all those swap issues.
set hidden
" Number of : commands to remember
set history=100
" By default, no wrapping is in place
set nowrap
" from VIm's :help tabstop
" 	2. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
"	   'expandtab'.  This way you will always insert spaces.  The
"	   formatting will never be messed up when 'tabstop' is changed.
set tabstop=2
set shiftwidth=2
set expandtab
" this is what actually makes the tab when you hit a new line after a block
" opening (or O on a block closing). It is also what 'messes' up indentation
" when you comment stuff out -- so you can check :help smartindent if you want
" to disable shifting of commented lines.
set smartindent
set autoindent
" This sets highlighting on found search terms
set hlsearch
" From the :help page:
" 	When a bracket is inserted, briefly jump to the matching one.  The
"	  jump is only done if the match can be seen on the screen.  The time to
"	  show the match can be set with 'matchtime'.
set showmatch
" This is basically just meant *not* to show the mode in the last line, since we
" are already using the airline plugin which shows us this stuff.
set noshowmode
" Shows status bar on all windows. Takes up a line, but we've plenty
set laststatus=2
" ??
set is
" 	A list of file patterns.  A file that matches with one of these
" 	patterns is ignored when expanding |wildcards|, completing file or
" 	directory names
set wildignore+=*/tmp/*,*.so,*.swp,*.pdf,*.zip,*/node_modules/*,*.css
let g:jsx_ext_required = 0

" make backspace work intuitively
set backspace=indent,eol,start

" make y and yy go to clipboard
set clipboard=unnamed

" macro to replace double quotes with single quotes
"fix this: let @a=:%s/\"\([^"]*\)\"/'\1'/

" Enable .md markdown syntax highlighting
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" NERDTree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>

" vim-ruby stuff
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1

" MuComplete Config
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt=longest,menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#buffer_relative_paths = 1
let g:mucomplete#chains = {
    \ 'default' : ['omni', 'keyn', 'dict', 'uspl', 'ulti'],
    \ 'vim'     : ['cmd', 'keyn']
 \ }

let g:ale_linters = {'ruby': 'rubocop'}
let g:ale_linters = {'elixir': 'credo' }

highlight ALEWarning ctermbg=White
"|ALEError|        - Items with `'type': 'E'`
"|ALEWarning|      - Items with `'type': 'W'`
"|ALEInfo.|        - Items with `'type': 'I'`
"|ALEStyleError|   - Items with `'type': 'E'` and `'sub_type': 'style'`
"|ALEStyleWarning| - Items with `'type': 'W'` and `'sub_type': 'style'`
"When |g:ale_set_signs| is set to `0`, the following highlights for entire
"lines will be set.
"|ALEErrorLine|   - All items with `'type': 'E'`
"|ALEWarningLine| - All items with `'type': 'W'`
"|ALEInfoLine|    - All items with `'type': 'I'`

" Javascript autoformat
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--trailing-comma --no-semi --no-bracket-spacing
      \ --single-quote --jsx-bracket-same-line --print-width 120'
     
" Theme options
"set termguicolors
"colorscheme base16-mocha
let g:one_allow_italics = 1
hi def link jsObjectKey Label

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_mocha'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled=1

" Salva as abas na sessão
set sessionoptions+=tabpages,globals

" Keyboard Shortcuts
let mapleader=" "
map <leader>s :source ~/.vim/vimrc<CR>
map <leader>S :e ~/.vim/vimrc<CR>

" Double Space to open last closed file
nnoremap <Leader><Leader> :e#<CR>

"Avoid keymap duplicates
nnoremap <C>@ <Plug>MuComplete

" Space + G to toggle GitGutter (git information)
nnoremap <Leader>g :GitGutterToggle<Enter>
" jj to return to Normal mode
inoremap jj <ESC>l
" jk to return to Normal Mode and save file
inoremap jk <ESC>:w<CR>
nnoremap <Leader>h :nohl<CR>
" Use TAB to change Split Panels
nnoremap <TAB> <C-w>w
" Use prettier to format Javascript code with gp
nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>
"Next and Previous Error
nnoremap <Leader>j :ALENext<CR>
nnoremap <Leader>k :ALEPrevious<CR>

" Custom commands
command! Dark execute "colorscheme base16-gruvbox-dark-pale"
command! Light execute "colorscheme base16-solarized-light"
command! Mocha execute "colorscheme base16-mocha"

" Find and Replace
nnoremap <Leader>f :vimgrep /
nnoremap <Leader>r :%s/
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>

"Copy to Clipboard
nnoremap <Leader>c "+y

" Damian Conway stuff
" ====[ Show when lines extend past column 80 ]====

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\S', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END
