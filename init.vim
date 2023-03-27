call plug#begin('/Users/akeen.lewis/.local/share/nvim/site/autoload')
 " Plugin Section
 "Plug 'overcache/NeoSolarized'
Plug 'marko-cerovac/material.nvim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'jayli/vim-easycomplete'
Plug 'SirVer/ultisnips'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'ludovicchabant/vim-gutentags'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lualine/lualine.nvim'
Plug 'wellle/context.vim'
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
call plug#end()
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set relativenumber          " show relative
set ignorecase              " case insensitiveC
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse clicik
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file

" set backupdir=~/.cache/vim " Directory to store backup files.


set termguicolors

nnoremap tff :Telescope find_files<CR>
nnoremap tlg :Telescope live_grep<CR>
nnoremap nt :NERDTreeToggle<CR>

" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
" let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
" let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
"let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
"let g:neosolarized_bold = 1
"let g:neosolarized_underline = 1
"let g:neosolarized_italic = 0

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
"let g:neosolarized_termBoldAsBright = 1

colorscheme material
let g:material_style = "darker"
set background=dark

" set for vim-devicons 
set encoding=UTF-8

" for language client
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
set omnifunc=syntaxcomplete#Complete
noremap gr :EasyCompleteReference<CR>
noremap gd :EasyCompleteGotoDefinition<CR>
noremap rn :EasyCompleteRename<CR>
noremap gb :BackToOriginalBuffer<CR>
"nnoremap <silent> <C-k> :EasyCompleteNextDiagnostic<CR>
"nnoremap <silent> <C-j> :EasyCompletePreviousDiagnostic<CR>
let g:easycomplete_tab_trigger="<c-space>"
let g:easycomplete_diagnostics_enable = 1
let g:easycomplete_signature_enable = 1
let g:easycomplete_tabnine_enable = 1
let g:easycomplete_cursor_word_hl = 1
let g:easycomplete_scheme = "blue"
" statusline
let g:easycomplete_sign_text = {
        \   'error':       "",
        \   'warning':     "",
        \   'information': '',
        \   'hint':        ''
        \ }
" Ruby error highlight

" gutentags setup
let g:gutentags_cache_dir = "/Users/akeen.lewis/.config/nvim/gutentags_cache"


" for lualine
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END

