set nocompatible              " required
let g:pear_tree_map_special_keys = 0
let g:pear_tree_map_cr = 0
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
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
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
let g:pear_tree_map_cr = 0 "conflicts with coc enter

filetype plugin indent on    " required

syntax on
" Fix syntax highlighting glitches
syntax enable
syntax sync minlines=256
syntax sync maxlines=500
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unfold code when on open
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable

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

" CtrlP configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.swo,*.swm,*.swn,*.~undo-tree~,*#

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
" nnoremap <C-f> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" search word prompt
nnoremap <C-f> :call <SID>AgSearch(expand('<cword>'))<CR>
function! s:AgSearch(default)
  let l:query = input('Ag search: ', a:default)
  if empty(l:query)
    return
  endif

  execute 'silent grep! ' . shellescape(l:query)
  copen
  redraw!
endfunction

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=c
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
nnoremap <silent> gb <C-o>


" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:format_exclude_paths = [
      \ 'alembic/versions/',
      \ 'migrations/',
      \ 'generated/',
      \ '__generated__/',
      \ 'node_modules/',
      \ 'venv/',
      \ '.venv/',
      \ '__pycache__/',
      \ 'dist/',
      \ 'build/',
      \ 'postgresql/',
      \ ]

function! s:is_excluded_file() abort
  let l:path = expand('%:p')

  for pattern in g:format_exclude_paths
    if l:path =~# pattern
      return v:true
    endif
  endfor

  return v:false
endfunction

augroup coc_format
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json if !s:is_excluded_file() |
        \ silent! call CocActionAsync('runCommand', 'prettier.formatFile')

  autocmd BufWritePre *.py if !s:is_excluded_file() |
        \ silent! call CocActionAsync('format') |
        \ silent! CocCommand editor.action.organizeImport |
        \ endif
augroup END

nnoremap <leader>h :CocCommand document.toggleInlayHint<CR>
nnoremap <leader>d :CocDiagnostics<CR>
