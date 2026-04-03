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
Plugin 'tmsvg/pear-tree'
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
Plugin 'nightsense/vim-crunchbang'
Plugin 'exitface/synthwave.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'sbdchd/neoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'prettier/vim-prettier'
Plugin 'hhatto/autopep8'
Plugin 'google/yapf'
Plugin 'ambv/black'
Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ericqweinstein/ruumba'
Plugin 'mattn/emmet-vim'
Plugin 'epilande/vim-react-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'sainnhe/everforest'
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1
syntax on
" Fix syntax highlighting glitches
syntax enable
syntax sync minlines=256
syntax sync maxlines=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unfold code when on open
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable
" set foldmethod=syntax "slows ALE so avoid it
" set foldmethod=indent
" augroup OpenAllFoldsOnFileOpen
"     autocmd!
"     autocmd BufRead * normal zR
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALEes :help ale-lint-file-linters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
      \ 'typescript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'javascript': ['eslint'],
      \ 'css': ['stylelint', 'prettier'],
      \ 'python': ['black', 'isort', 'autopep8', 'prettier'],
      \ 'json': ['prettier']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver', 'prettier'],
\   'typescriptreact': ['eslint', 'tsserver', 'prettier'],
\   'css': ['stylelint'],
\   'json': ['prettier'],
\   'python': ['pylint', 'autopep8', 'flake8', 'black'],
\   'scala': ['scalac'],
\   'eruby': ['ruumba', 'erb'],
\   'ruby': ['ruby'],
\   'java': ['javalsp']
\}

let g:typescript_indent_disable = 1
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
let g:ale_fix_on_save = 1

nnoremap <F3> :ALEFix<CR>
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
set wildignore=*.swp,*.bak,*.pyc,*.class,*.DS_Store,*.swo,*.~undo-tree~,*.undo-tree*
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '*\.DS_Store', '\.DS_Store$', '\.DS_Store', '\.swo$', '__pycache__']
let NERDTreeRespectWildIgnore=1

" enable when its not rendering as expected
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('termguicolors')
  set termguicolors " 24-bit terminal
else
  let g:synthwave_termcolors=256 " 256 color mode
endif

"set termguicolors

set background=dark
"set background=light

"colorscheme PaperColor
"colorscheme iceberg
"colorscheme base16-default-dark
"colorscheme stormpetrel
"colorscheme petrel
"colorscheme crunchbang
"colorscheme srcery-drk
"colorscheme synthwave
"colorscheme deep-space
colorscheme tokyonight
"colorscheme everforest

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vertical line for cursor good for dark only
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set cursorcolumn
"hi CursorColumn ctermbg=8
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

" Open NERDTree always as certain width
let g:NERDTreeWinSize = 45
autocmd VimEnter * NERDTree
autocmd VimEnter * set winfixwidth

"" VERY SLOW so disabled as suggested
let NERDTreeHighlightCursorline = 0

" limited scope file ext for highlighting
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set backspace=indent,eol,start
set clipboard=unnamed
set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.swo,*.swm,*.swn,*.~undo-tree~,*#

" let g:ycm_path_to_python_interpreter="/usr/local/bin/python3"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path=substitute(system("which python"), "\n$", "", "")
let $PYTHONPATH=getcwd() . ":" . $PYTHONPATH

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gb <C-o>

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
" Make sure silver searcher is installed in your computer
" brew install the_silver_searcher
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

" shortcut to run emmet ,, (comma comma)
let g:user_emmet_leader_key=','
let g:UltiSnipsExpandTrigger="<C-l>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Needs the following font:
"   brew tap caskroom/fonts
"   brew cask install font-hack-nerd-font
"   ~default file icon
set guifont=Hack\ Nerd\ Font:14
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
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css,xml,html inoremap </ </<C-x><C-o>
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let g:ycm_filepath_blacklist = {'*': 1}
nnoremap ,S :g/{/+,/}/-sort<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Profiling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!

" Configure ALE to use the project's Python virtual environment if it exists
function! ALEUseProjectVenv() abort
    let l:venv_path = finddir('.venv', '.;')
      if empty(l:venv_path)
        let l:venv_path = finddir('venv', '.;')
      endif
    if !empty(l:venv_path)
        let g:ale_python_flake8_executable = l:venv_path . '/bin/flake8'
        let g:ale_python_pylint_executable = l:venv_path . '/bin/pylint'
        let g:ale_python_executable = l:venv_path . '/bin/python'
    endif
endfunction

" Call the function when opening a Python file
autocmd FileType python call ALEUseProjectVenv()

