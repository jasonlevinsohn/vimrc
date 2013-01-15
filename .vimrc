
set nocompatible " this is already set above -- only here for reference
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"Load some vundles - plugins
"Bundle 'username/reponame'
"It's just the tailend of the githup repo

Bundle 'gmarik/vundle'

"ColorSchemes

Bundle 'flazz/vim-colorschemes'

"}}}


"Extra Syntaxes {{{

Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'

"}}}



Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'

"Auto Completion

Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neocomplcache'

"Tabluar - used for aligning characters like = or :
Bundle 'godlygeek/tabular'

"MatchTag - highlights matching HTML tags when 
"the cursor is over one of the tags.
Bundle 'gregsexton/MatchTag'

filetype plugin indent on
syntax on
"First scheme: colorscheme zenburn


" ---------------------------------------------------------------------------- 
" ----------------------------------------------------------------------------
" Default tabstop / spacing
set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set noswapfile "Nobody likes a swap file

set laststatus=2 "Shows the status bar
set relativenumber "Enable Line Numbers
set ruler "Shows the line number on the status bar
filetype indent on

"vim 7.3+ settings
set undofile "keep a a persistent undo file so we can undo after a reboot
set undodir=~/.vimundo//
set undoreload=10000


set showmatch "show us matching brackets, etc.

"Search Settings
set hlsearch


"INSERT MODE - inoremap no other remap can come in here and override jf="the keys we want to map" <esc> the command you want to run
"NORMAL MODE - nnoremap

"Defines the <leader> tag when assigning key bindings
let mapleader=","

inoremap jf <esc>  
nnoremap ; : 

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

"Turned off Arrow Keys to force myself to use home row key navigation
nnoremap <up> <Nop>
nnoremap <down> <Nop>
nnoremap <left> <Nop>
nnoremap <right> <Nop>

inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>


vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

"Makes it easier to switch Split Views no more (i.e. Ctrl-W j)
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"Clear that freakin highlighed search
nnoremap <leader><space> :noh<cr>


"Shows invisible characters
"set list
"set listchars=tab:▸\ ,eol:¬

"Save the file when losing focus
"au FocusLost * :wa


"Plug-in Manager, you can use pathogen or Bundle (Vundle) - {{{

" Tabular 
    nnoremap <leader>a: :Tab /:<cr>
    vnoremap <leader>a: :Tab /:<cr>
    vnoremap <leader>f; :Tab /:\zs<cr>
    nnoremap <leader>f; :Tab /:\zs<cr>



" zencoding settings

    let g:user_zen_leader_key = '<c-e>'
   " 4 space soft tabs
    let g:user_zen_settings = {'indentation': '    '}
    let g:use_zen_complete_tag = 1


" vim-commentary

    nmap <leader>c <Plug>CommentaryLine
    xmap <leader>c <Plug>Commentary


" ctrlp.vim

    let g:ctrlp_map = '<c-t>'
    let g:ctrlp_max_height = 30

    " Syntastic {{{

        let g:syntastic_enable_signs = 1
        let g:syntastic_disabled_filetypes = ['html', 'py']
        let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
        let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'

    " }}}

    " delimitMate {{{


        let delimitMate_expand_cr = 1
        let delimitMate_expand_space = 1


    " }}}
    
    
        

" }}} - End Plug-in Manager


" neocomplecache {{{

        " There are many settings here. Don't mess with it unless you really
        " know what your doing. This is as close to Intellisense as we can get
        " right now.

        " Only show if I've stopped typing for a tenth second.
        let g:neocomplcache_enable_cursor_hold_i = 1
        let g:neocomplcache_cursor_hold_i_time = 100

        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1

        " AutoComplPop like behavior.
        let g:neocomplcache_enable_auto_select = 0

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " <CR>: close popup 
        " <s-CR>: close popup and save indent.
        " inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        " inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>" 
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        " User defined snippets
        let g:neocomplcache_snippets_dir = '~/.vim/mysnippets/'

        " SuperTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " }}}



   
