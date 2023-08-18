" =============================================================================
" Plugins
" =============================================================================

call plug#begin()
	Plug 'mhinz/vim-startify'

	" File Manager
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'

	" Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdcommenter'
	Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
	Plug 'jiangmiao/auto-pairs'
	
	" Top Bar
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'

	" Telescope
	Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
	Plug 'nvim-telescope/telescope-ui-select.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" Syntax Highlighting
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'luochen1990/rainbow'
	Plug 'mxw/vim-jsx'
	Plug 'pangloss/vim-javascript'
call plug#end()

" colorscheme onedark

" Start NERDtree and put the cursor back in the other window
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

:set mouse=a

" setting the terminal gui colors for the color preview
:set termguicolors

" bind CTRL+f to toggle the file manager
nmap <C-f> :NERDTreeToggle<CR>

" bind CTRL+/ to comment code out
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
  

"get rid of [  ] around icons in NerdTree
syntax enable
autocmd VimEnter * source ~/.config/nvim/init.vim
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Code Completion

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

filetype plugin on

" Fuzzy finder
noremap <silent>ff <cmd>Telescope find_files<cr>

" Bracket Pair Colorizer
let g:rainbow_active = 1

" Hexokinase
let g:Hexokinase_highlighters=['backgroundfull']

" =============================================================================
" BarBar Config
" =============================================================================

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" =============================================================================
" Startify Settings
" =============================================================================

let g:startify_bookmarks = [
	\ {'z': '~/.zshrc'},
	\ {'v': '~/.config/nvim/init.vim'},
	\ ]

let g:startify_custom_header =[
 \' __              ___    ___                                         ___       __     ',
 \'/\ \            /\_ \  /\_ \                                       /\_ \     /\ \    ',
 \'\ \ \___      __\//\ \ \//\ \     ___      __  __  __    ___   _ __\//\ \    \_\ \   ',
 \' \ \  _ `\  /''__`\\ \ \  \ \ \   / __`\   /\ \/\ \/\ \  / __`\/\`''__\\ \ \   /''_` \  ',
 \'  \ \ \ \ \/\  __/ \_\ \_ \_\ \_/\ \L\ \  \ \ \_/ \_/ \/\ \L\ \ \ \/  \_\ \_/\ \L\ \ ',
 \'   \ \_\ \_\ \____\/\____\/\____\ \____/   \ \___x___/''\ \____/\ \_\  /\____\ \___,_\',
 \'    \/_/\/_/\/____/\/____/\/____/\/___/     \/__//__/   \/___/  \/_/  \/____/\/__,_ /',
 \]
