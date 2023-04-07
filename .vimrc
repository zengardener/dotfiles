execute pathogen#infect()
syntax enable
set encoding=utf-8
set ignorecase
set backup
set history=10000
"nnoremap <F10> :set invpaste paste? <CR>
"set pastetoggle=<F10>
set showmode
set statusline=%F "Full path to the file in the buffer
set statusline+=%m "Modified flag, text is "[+]"; "[-]" if 'modifiable' is off
set statusline+=%r "Readonly flag, text is "[RO]"
set statusline+=%h "Help buffer flag, text is "[help]"
set statusline+=%w\  "Preview window flag, text is "[Preview]"
set statusline+=[FORMAT=%{&ff}]\  "File format
set statusline+=[TYPE=%Y]\  "File type
set statusline+=[POS=%l,%v][%p%%]\  "Cursor position
set statusline+=[DEC=%b\ HEX=0x%B]\  "ASCII code of char under cursor
set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")} "Date and time
set laststatus=2
filetype on 
filetype plugin on
filetype indent on
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"perl indenting
autocmd Filetype perl setlocal ts=4 sts=4 sw=4 et number

"check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

"yaml indenting
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 et number

"Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let mapleader="\<Space>"
nnoremap <Leader>o :CtrlP<CR>

" let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
"colorscheme default

set cursorline
highlight CursorLine cterm=underline

highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%80v\+/

function InitBackupDir()
    let separator = "."
    let parent = $HOME .'/' . separator . 'vim/'
    let backup = parent . 'backup/'
    let tmp    = parent . 'tmp/'

    if exists("*mkdir")
        if !isdirectory(parent)
            call mkdir(parent)
        endif
        if !isdirectory(backup)
            call mkdir(backup)
        endif
        if !isdirectory(tmp)
            call mkdir(tmp)
        endif
    endif

    let missing_dir = 0
    if isdirectory(tmp)
        execute 'set backupdir=' . escape(backup, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if isdirectory(backup)
        execute 'set directory=' . escape(tmp, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if missing_dir
        echo "Warning: Unable to create backup directories: " 
        . backup ." and " . tmp
        echo "Try: mkdir -p " . backup
        echo "and: mkdir -p " . tmp
        set backupdir=.                 
        set directory=.
    endif

endfunction          

call InitBackupDir()
