set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'cocopon/iceberg.vim'
Plugin 'nightsense/seabird'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim.git'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kamwitsta/nordisk'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'saalaa/ancient-colors.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'PyCQA/pylint'
Plugin 'nvie/vim-flake8'
Plugin 'powerline/powerline'
Plugin 'ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nightsense/vim-crunchbang'
Plugin 'kudabux/vim-srcery-drk'
Plugin 'exitface/synthwave.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'sbdchd/neoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'prettier/vim-prettier'
Plugin 'hhatto/autopep8'
Plugin 'google/yapf'
Plugin 'ambv/black'
Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unfold code when on open
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set foldmethod=syntax slows ALE so avoid it
set foldmethod=indent
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALEes :help ale-lint-file-linters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = { 'javascript': ['eslint'], 'python': ['black', 'isort', 'autopep8', 'prettier'] }
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint', 'autopep8', 'flake8', 'black'],
\   'scala': ['scalac'],
\   'java': ['javalsp']
\}
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1

" signs on gutter
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_open_list = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" something to do with performance cacheing
let g:ale_cache_executable_check_failures = 1

" control when to run lint
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE FORMAT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set statusline+=%#warningmsg#
set statusline+=%*

set number
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

set encoding=utf-8
set wildignore=*.swp,*.bak,*.pyc,*.class,*.DS_Store,*.swo
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '*\.DS_Store', '\.DS_Store$', '\.DS_Store', '\.swo$', '__pycache__']

"set background=dark
set background=light
colorscheme PaperColor
"colorscheme iceberg
"colorscheme base16-default-dark
"colorscheme stormpetrel
"colorscheme petrel
"colorscheme crunchbang
"colorscheme pyte
"colorscheme srcery-drk
"colorscheme synthwave
"colorscheme deep-space

" enable when its not rendering as expected
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has('termguicolors')
"  set termguicolors " 24-bit terminal
"else
"  let g:synthwave_termcolors=256 " 256 color mode
"endif
"
"set termguicolors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOFORMAT CODE formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " defaults when no file type specified
" " Enable alignment
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_try_formatprg = 1
"
" " javascript formatter: https://github.com/prettier/prettier
" " python formatter: https://github.com/google/yapf
" " scala formatter: https://github.com/scala-ide/scalariform

let g:javascript_plugin_flow = 1
let g:javascript_plugin_ngdoc = 1
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

" limited scope file ext for highlighting
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Open NERDTree always as certain width
let g:NERDTreeWinSize = 50
autocmd VimEnter * NERDTree
autocmd VimEnter * set winfixwidth

"   Devicons
"   Needs the following font:
"   brew tap caskroom/fonts
"   brew cask install font-hack-nerd-font
"   ~default file icon
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
"   ~default folder icon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
"   ~custom file icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('txt', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('csv', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('gz', 'green', 'none', 'green', '#151515')

call NERDTreeHighlightFile('jar', 'Red', 'none', '#ffa500', '#151515')

call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('in', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yaml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('xml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('iml', 'yellow', 'none', 'yellow', '#151515')

call NERDTreeHighlightFile('json', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sql', 'cyan', 'none', 'cyan', '#151515')

call NERDTreeHighlightFile('html', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('hbs', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('styl', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('css', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('sass', 'Magenta', 'none', '#ff00ff', '#151515')

call NERDTreeHighlightFile('py', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('scala', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('php', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('java', 'cyan', 'none', 'cyan', '#151515')

call NERDTreeHighlightFile('json', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('sql', 'blue', 'none', '#3366FF', '#151515')

call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('swp', 'Gray', 'none', '#686868', '#151515')

"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('py', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')
"call NERDTreeHighlightFile('scala', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set backspace=indent,eol,start
set clipboard=unnamed
set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.swo,*.swm,*.swn

" let g:ycm_path_to_python_interpreter="/usr/local/bin/python3"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path=substitute(system("which python"), "\n$", "", "")
let $PYTHONPATH=getcwd() . ":" . $PYTHONPATH

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set laststatus=2

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" refresh color highlights
autocmd BufEnter,InsertLeave * :syntax sync fromstart


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Searching texts within files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" search word under cursor
nnoremap <C-f> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Profiling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!
