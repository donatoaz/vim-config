call plug#begin()
" Plug 'ecomba/vim-ruby-refactoring'
Plug 'scrooloose/nerdtree'
" Plug 'chriskempson/base16-vim'
" Plug 'roman/golden-ratio'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting and autoindenting
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

Plug 'airblade/vim-gitgutter'

" https://github.com/Chiel92/vim-autoformat
" use command :Autoformat it gets the file type and knows which formatter to
" use
Plug 'Chiel92/vim-autoformat'

" YOU NEED A FILE .ctrlpignore at the root of each project indicating which
" directories to ignore... I've done so because in some projects I do like 
" being able to ctrlp through node_modules...
Plug 'kien/ctrlp.vim'
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'

" this is the cow-screen plugin, only needed when opening VIm without
" specifying a file name or directory
" Plug 'mhinz/vim-startify'

" This is a Vim plugin that provides Tern-based JavaScript editing support
" such as jump to definition or rename variable
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" couldnt make this work, somehow
" Plug 'gcmt/taboo.vim'

" So used this instead... Tab functionality with nerdtree
Plug 'jistr/vim-nerdtree-tabs'
nmap <leader>, :bprevious<CR>
nmap <leader>. :bnext<CR>
nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>
nmap <leader>5 :bfirst<CR>:4bn<CR>
nmap <leader>6 :bfirst<CR>:5bn<CR>

Plug 'lifepillar/vim-mucomplete'
" MuComplete Config
"inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
"inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
"inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt=menuone
set completeopt+=noinsert
"set completeopt+=longest,
let g:mucomplete#enable_auto_at_startup = 1

" when 0, filepaths are interpreted relative to pwd (default)
" when 1, filepaths are interpreted relative to buffer location
" let g:mucomplete#buffer_relative_paths = 1

let g:mucomplete#force_manual = 1
" let g:mucomplete#can_complete = {}
" let g:mucomplete#can_complete.default = {
"     \  'omni': {
"     \     t -> g:mucomplete_with_key
"     \   },
"     \  'keyn': {
"     \     t -> g:mucomplete_with_key
"     \  }
"     \ }
let g:mucomplete#chains = { 'default': ['omni', 'keyn'] }
"	:MUcompleteNotify 3

Plug 'mattn/jscomplete-vim'
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
Plug 'ahayman/vim-nodejs-complete'

Plug 'tmhedberg/matchit'

" automagically creates the closing parens
" <Leader>a( will wrap selection in (). Also works with other characters 
Plug 'Townk/vim-autoclose'

" autoclose (x)html tags
Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript.jsx'

" Syntax hl for html
Plug 'othree/html5.vim'

" Syntax hl for vue components
"Plug 'posva/vim-vue'

" <Leader>cc comments out selection
" when in normal mode, <Leader>c<space> toggles current comment state of
" line(s)
Plug 'vim-scripts/The-Nerd-Commenter'

" Allows for ascii table creation in vim
"Plug 'dhruvasagar/vim-table-mode'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Elixir plugins
"Plug 'elixir-editors/vim-elixir'
"Plug 'slashmili/alchemist.vim'

" Git plugin
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
noremap :gst :Gstatus
noremap :gd :Gvdiff
noremap :gb :Gblame
noremap :gg :Gblame

"Plug 'qpkorr/vim-bufkill'
" Plug 'kchmck/vim-coffee-script'
" ES2015 code snippets (Optional)
" Plug 'epilande/vim-es2015-snippets'
" React code snippets
" Plug 'epilande/vim-react-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'reinh/jquery-autocomplete'
Plug 'junegunn/vim-emoji'
" Plug 'vim-scripts/loremipsum'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
"Plug 'smintz/vim-sqlutil'
"Plug 'vim-scripts/Align'
Plug 'dracula/vim',{'as':'dracula'}
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
set wildignore+=*/tmp/*,*.so,*.swp,*.pdf,*.zip,*/node_modules/*,*/bower_components/*,*/cassettes/*,*/dist/*
let g:jsx_ext_required = 0

" Ignore case on vim searches
set ignorecase

" make backspace work intuitively
set backspace=indent,eol,start

" make y and yy go to clipboard
set clipboard=unnamed
" set clipboard=unnamedplus

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
" original
" let g:ale_javascript_prettier_options = '--trailing-comma --no-semi --no-bracket-spacing
" let g:ale_javascript_prettier_options = '--trailing-comma
"      \ --single-quote --jsx-bracket-same-line --print-width 120'
let g:ale_javascript_prettier_options = '--config ./prettier.config.js'
     
" Theme options
" set termguicolors
let base16colorspace=256
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

" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-l>"

" Salva as abas na sessão
set sessionoptions+=tabpages,globals

" Keyboard Shortcuts
let mapleader=" "
map <leader>s :source ~/.vim/vimrc<CR>
map <leader>S :e ~/.vim/vimrc<CR>
map <leader>z :e ~/.zshrc<CR>
map <leader>t :e ~/.hyper.js<CR>

" Indent json
map <leader>json :%!python -m json.tool<CR>

" Space t runs rails minitest on current file
"map <leader>t :!rails test %<CR>

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
" nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>
nnoremap gp :silent %!./node_modules/.bin/prettier --stdin --config ./prettier.config.js<CR>
"Next and Previous Error
nnoremap <Leader>j :ALENext<CR>
nnoremap <Leader>k :ALEPrevious<CR>

" difftool sugar
map <leader>nn :qa<CR>

" xmllint formatting
" nnoremap xml :%!xmllint --format -<CR>

" Custom commands
command! Dark execute "colorscheme base16_eighties"
command! Light execute "colorscheme base16_solarized-light"
command! Mocha execute "colorscheme base16_mocha"

" Find and Replace
nnoremap <Leader>f :vimgrep /
nnoremap <Leader>r :%s/
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>

"Copy to Clipboard
nnoremap <Leader>c "+y

" Run npm run build
" nnoremap <leader>rr :silent !npm run build<CR> | execute ':redraw!'
" nnoremap <leader>rr :silent !npm run build<CR>
nnoremap <leader>rrr :redraw!<CR>

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
        let b:MarkMargin = matchadd('ColorColumn', '\%121v\s*\S', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END

set completefunc=emoji#complete

"increase curent split size by 50%
nnoremap <silent><Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
"decrease currnte split size by 33%
nnoremap <silent><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"increase curent split size by 50%
nnoremap <silent><Leader>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
"decrease currnte split size by 33%
nnoremap <silent><Leader>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Toggles between line numbering styles (none, absolue, relative, relative 0)
nn <silent> <leader>N :call ToggleNumber()<CR>
fun! ToggleNumber() "{{{
	if exists('+relativenumber')
		:exec &nu==&rnu? "setl nu!" : "setl rnu!"
	else
		setl nu!
	endif
endf "}}}

" search for selection
vnoremap // y/<C-R>"<CR>

" Trigger configuration (Optional)
"let g:UltiSnipsExpandTrigger="<C-l>"

set tags=tags

" move lines http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
