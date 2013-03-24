" © 2013 D Malam
" Dotty Vim config file
set nocompatible            " Use new VIM features (Vundle)
filetype off
" Init Vundle {{{
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
" Vundle manages Vundle.
Bundle 'gmarik/vundle'
" }}}

" Plugins {{{
" General
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'sjl/gundo.vim'
" Highlight SCM conflict markers
Bundle 'ConflictDetection'
" Buffer UI
Bundle 'bufexplorer.zip'
" Git addin
Bundle 'tpope/vim-fugitive'
" Ctags support
Bundle 'majutsushi/tagbar'
" ^C^C like emacs
Bundle 'jpalardy/vim-slime'

" UI
" A set of themes
Bundle 'flazz/vim-colorschemes'
Bundle 'xoria256.vim'
" Fancy statusbar
Bundle 'Lokaltog/vim-powerline'

" Editing
" Sudo edit
Bundle 'chrisbra/SudoEdit.vim'
" Use <leader><leader><motion> to init
Bundle 'Lokaltog/vim-easymotion'
" Complete (,{,[
Bundle 'Townk/vim-autoclose'
" Use c to change surrounding '," etc
Bundle 'tpope/vim-surround'
" Make ^A,^X inc/deinc work for dates.
Bundle 'tpope/vim-speeddating'
" Use \\\ to comment, works with motions, and VISUAL.
Bundle 'tpope/vim-commentary'
" Alias' for [].
Bundle 'tpope/vim-unimpaired'
" Make . work for surrond, speeddating, commentary
Bundle 'tpope/vim-repeat'
Bundle 'godlygeek/tabular'
" Make % match more things.
Bundle 'matchit.zip'
" Visual indents
Bundle 'nathanaelkane/vim-indent-guides'

" Completion
" Syntax checking
Bundle 'scrooloose/syntastic'
" Fuzzy find.
Bundle 'kien/ctrlp.vim'
" Fuzzy code completion
" Bundle 'Valloric/YouCompleteMe'

" Languages
" JavaScript
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
" HTML
Bundle 'othree/html5.vim'
" CSS
Bundle 'groenewege/vim-less'
" Markdown
Bundle 'tpope/vim-markdown'

" }}}

" General {{{
filetype on                 " Enable filetype detection. (Vundle)
filetype plugin on          " Enable filetype-specific plugins (Vundle)
filetype indent on          " Enable filetype-specific indenting.
"set autochdir               " Change cwd to current file.
set autoread                " Watch for file changes.
"set autowrite               " Automatically write a file when leaving a modified buffer
set hidden                  " Allow buffers that are windowless.
set noerrorbells            " No beeps.
set virtualedit=onemore     " Allow for cursor beyond last character
set diffopt=filler,vertical " Diff mode, add filler, vsplit, also:icase,iwhite
" }}}

" UX {{{
set confirm                 " Raise dialog instead of failing on certain ops.
set cursorline              " Highligh current line.
set showmatch               " Show matching brackets.
set number                  " Line numbers.
set numberwidth=3           " Save 1 col, for files < 100.
set lazyredraw              " Postpone many redraws.
"set relativenumber          " Relative line numbers.
set nowrap                  " No Wrapping, as VIM can' break lines sensibly with UTF-8.
set shortmess=atI           " Abbreviate and truncate messages, no intro.
set scrolloff=2             " Minimum lines to keep above and below cursor.
set sidescroll=2            " Minimum cols to scroll horz.
set sidescrolloff=2         " Mimimum cols to keep when scrolling left/right.
set list                    " Show whitespace
set listchars=tab:→∙,trail:◦,extends:…,precedes:«,nbsp:•,conceal:✵ " Highlight problematic whitespace
set nostartofline           " Make ^D,^U,^B,^F,G,H,M,L,gg etc keep same column.
set backspace=2                 " Backspace over index,eol,start
set whichwrap=b,s,<,>,~,[,] " Make <left>/<right> wrap.
" }}}

" Status {{{
set showcmd                 " Show (partial) command in status line.
set ruler                   " Show the line number on the bar.
set laststatus=2            " Always show statusline in each window.
" }}}

" Security {{{
set nomodeline              " Don't run commands in docs.
set secure                  " Restrict .vimrc, .exrc in current dir.
set cryptmethod=blowfish    " Use safer encryption (vim 7.3 only). Use :X to encrypt.
" }}}

" Encoding {{{
set fileformats=unix        " Always use unix <EOL>
set termencoding=utf-8      " Unicode terminal.
set encoding=utf-8          " Unicode for files.
"}}}

" Tabs {{{
set expandtab               " Tabs -> spaces.
set smarttab                " Inserts blanks according to shiftwidth.
set softtabstop=4           " Num of spaces that a tab counts for in editing.
set tabstop=4               " A tab is four spaces
"}}}

" Indents {{{
set autoindent              " Always set autoindenting on
set smartindent             " Smart indenting on new line.
set copyindent              " Copy the previous indentation on autoindenting
set shiftwidth=4            " Number of spaces to use for indenting.
set shiftround              " Use multiple of shiftwidth when indenting with '<' and '>'.
" }}}

" Spelling {{{
set spelllang=en_US         " English for spellchecking.
set nospell                 " Don't spellcheck by default.
" }}}

" Folding rules {{{
set foldenable              " Enable folding.
set foldcolumn=3            " 2 char fold margin.
set foldmethod=marker       " 3{s start/end fold markers. Also: indent
set foldlevelstart=0        " Start with everything folded.
set foldopen=all            " All command trigger auto-unfold.
set foldnestmax=10          " Don't nest too much.
" }}}

" Searching {{{
set ignorecase              " Ignore case
set smartcase               " Override ignorecase if pattern contains
set incsearch               " Incremental searching. Use ^L to add 1 char, ^R^W to add word
set hlsearch                " Highlight search items.
set gdefault                " Always use 'replace all' flag. Use '/g' to specify one.
" }}}

" History {{{
set history=5000            " History of : commands and previous search patterns.
set undolevels=2000         " Level of undoes.
" }}}

" Files {{{
set viminfo='1000,<500,s20,h,%,c,r/tmp,n$DOTTY_VAR/viminfo  " Save more, and in $DOTTY_VAR
set backupcopy=auto         " Choose best method for backups when saving.
set noswapfile              " No swap file, OS PAGING!
set undofile                " Persist undos
set undodir=$DOTTY_VAR/vim  " Use DOTTY_VAR for all undoes.
" }}}

" Splits {{{
set splitbelow              " Make new splits below current.
set splitright              " Make new vsplit to the right.
" }}}

" UI {{{
if has('gui_running')
    set clipboard=unnamed               " Use system clipboard (MacVim)
else
    set t_vb=''                         " Silent visual bell

    " Screen\ePtmux;\e\e]7;%s\a\e\\
    if &term =~ '^screen'
        set t_ts=k                    " Escape to actual terminal
        set t_fs=\
    endif

    " Color
    if &t_Co > 2
        syntax on                       " Syntax on if colors supported
    endif
    if &t_Co >= 256
        set background=dark             " Select colors for a dark background.
        colorscheme xoria256            " Select color theme.
    endif

    " Title
    set title                           " Change the terminal's title
    set titlelen=50                     " Make title 50% of width (better for tmux)
    set titleold=""                     " No silly 'Thanks for flying Vim'.
    set titlestring+=%m                 " Modified flag.
    set titlestring+=%r                 " Readonly flag.
    set titlestring+=%w                 " Preview window flag.
    " Use set-title to set icon.
    autocmd WinEnter,BufWinEnter /?* :silent ! set-title "%:p"
    " Reset icon on exit.
    autocmd VimLeave * :silent !chpwd
    " Mouse
    set mouse=a                         " Use mouse for all modes.
    set ttymouse=xterm2                 " xterm2 mouse mode.
end
"}}}

" Completion {{{
set wildmenu                            " Command-line completion
set wildmode=list:longest,list:full     " List all & complete longest common string, then first match.
set wildignore=*.swp,*.bak,*.pyc,*.class,*.git,*.hg,*.svn,*.DS_STORE,*.o,*.obj " Ignors (CTRL-P) "

" Better Completion
set complete=.,w,b,u,t,i                " Default.
set completeopt=menu,menuone,longest,preview " Show menu for one match, insert longest, show preview
" automatically open and close the popup menu / preview window
 au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
 " }}}

" Key mappings {{{
let mapleader = ','                       " leader is ,
nnoremap <leader><space> :nohlsearch<cr>  " Remove highlighting
set pastetoggle=<C-P>                     " Control-P toggles paste mode

noremap <tab> %
vnoremap <tab> %

" Wrapped lines go up/down, instead of next line in file
nnoremap j gj
nnoremap k gk

" , -> ; -> :
noremap : <nop>
noremap ; :
noremap , ;

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Yank from the cursor to EOL
noremap Y y$

" Space will toggle folds
nnoremap <space> za

" Bubble single lines
nnoremap <C-k> ddkP
nnoremap <C-j> ddp

" Bubble multiple lines
vnoremap <C-k> xkP`[V`]
vnoremap <C-j> xp`[V`]

" Emacs bindings in command line mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Code folding options
nnoremap <leader>f0 :set foldlevel=0<CR>
nnoremap <leader>f1 :set foldlevel=1<CR>
nnoremap <leader>f2 :set foldlevel=2<CR>
nnoremap <leader>f3 :set foldlevel=3<CR>
nnoremap <leader>f4 :set foldlevel=4<CR>
nnoremap <leader>f5 :set foldlevel=5<CR>
nnoremap <leader>f6 :set foldlevel=6<CR>
nnoremap <leader>f7 :set foldlevel=7<CR>
nnoremap <leader>f8 :set foldlevel=8<CR>
nnoremap <leader>f9 :set foldlevel=9<CR>

" Autocommands {{{
" Resize splits when the window is resized
au VimResized * :wincmd =

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Filetypes {{{

" JavaScript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
" Tagbar support
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" Markdown Tagbar ctags support
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" Ruby
" non ruby files which are ruby
au BufNewFile,BufRead Gemfile,Gemfile.lock,Guardfile,Rakefile,*.rake set filetype=ruby
" reject! and responds_to? are methods in ruby
autocmd FileType ruby setlocal iskeyword+=!,?,@
" make rspec stuff part of ruby syntax
autocmd BufNewFile,BufRead *_spec.rb syn keyword ruby describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" LISP
" Scheme & clojure are LISPs
au BufNewFile,BufRead *.scm,*.clj set lisp

" yaml indent settings
au BufNewFile,BufRead  *.yml,*.yaml set foldmethod=indent
au BufNewFile,BufRead  *.yml,*.yaml set foldlevel=1

" }}}

" Functions {{{
" Save a file as root (:w!!)
cmap w!! SudoWrite %
"}}}

" Plugins {{{
" Numbers
nnoremap <F3> :NumbersToggle<CR>

" NERDTree
" Mapping to NERDTree
nnoremap <F5> :NERDTreeTabsToggle<CR>
inoremap <F5> <Esc>:NERDTreeTabToggle<CR>
noremap <leader>e :NERDTreeFind<CR>
noremap <leader>nt :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeChDirMode=2                             " Set CWD to tree root.
let NERDTreeMouseMode=2                             " Single click.
let NERDTreeQuitOnOpen=1                            " Close NERDTree when opening file.
let NERDTreeShowBookmarks=1                         " Show Bookmarks.
let NERDTreeShowHidden=1                            " Show Hidden files.
let NERDTreeDirArrows=1                             " Show arrows.
let NERDTreeCasadeOpenSingleChildDir=1              " Autoopen single dirs.
let g:nerdtree_tabs_open_on_gui_startup=0           " Dont open NERDTree on GUI

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" Gundo
noremap <F7> :GundoToggle<CR>

" TagBar
noremap <F6> :TagbarToggle<CR>

" Syntastic
let g:syntastic_check_on_open=1               " Check on load
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*"

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Easymotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" CTRL-P
let g:ctrlp_map                 = '<c-p>'       " Default.
let g:ctrlp_cmd                 = 'CtrlPMixed'  " Start in mixed mode.
let g:ctrlp_regexp              = 1             " Use regexs.
let g:ctrlp_clear_cache_on_exit = 0             " Cross session caching.
let g:ctrlp_cache_dir           = $DOTTY_VAR.'/ctrlp'
let g:ctrlp_show_hidden         = 1             " Show hidden

" Tabularize
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
nnoremap <Leader>a:: :Tabularize /:\zs<CR>
vnoremap <Leader>a:: :Tabularize /:\zs<CR>
nnoremap <Leader>a, :Tabularize /,<CR>
vnoremap <Leader>a, :Tabularize /,<CR>
nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
nnoremap <Leader>a" :Tabularize /"<CR>
vnoremap <Leader>a" :Tabularize /"<CR>
nnoremap <Leader>a# :Tabularize /#<CR>
vnoremap <Leader>a# :Tabularize /#<CR>

" Indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Slime uses tmux panes
let g:slime_target = "tmux"

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

