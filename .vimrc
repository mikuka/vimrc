" использование оболочки bash
" set shell=bash
" запрет режима совместимости с vi
set nocompatible
" включение подсветки
syntax on
" поддержка backspace в режиме вставки
set backspace=indent,eol,start
" размер истории командной строки (в строках)
set history=50
" постоянное отображение позиции курсора (# строки и # символа от начала
" строки)
set ruler
" отображение незавершенных команд
set showcmd
" ПОИСК
" поиск при вводе шаблона
set incsearch
" игнорирование регистра при поиске
set ignorecase
" включение желтой подсветки выражений результатов поиска
set hlsearch
" поиск учитывает регистр только если в запросе есть буквы, написанные в
" верхнем регистре
set smartcase

" автодополненеи пути в командной строке
" set wildmode=longest,list
set wildmode=list:longest,full
" запрет создания файла бэкапа
set nobackup
" запрет создания файла свапа
set noswapfile
" отображение номеров строк
set number
" ТАБУЛЯЦИЯ, см. http://habrahabr.ru/post/64224
" настройка табуляции (ширина, сдвиг)
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab expandtab
" копирование отступа от предыдущей строки
set autoindent
" включение умной автотабуляции
" set smartindent
" включение переноса строк
set wrap
" дополнение переноса строки спец символом
let &showbreak = '↳ '
"set cpo=79
" автоперенос по словам
"set tw=79
"set formatoptions+=t

" кодировка терминала, должна совпадать с той, которая используется для вывода
" в терминал
set termencoding=utf-8
set encoding=utf8
" возможные кодировки файлов и последовательность определения.
set fileencodings=utf8,cp1251
" кол-во цветов
set t_Co=256
" цветовая схема
colorscheme desert256
" отображение столбца по ширине строки
set colorcolumn=80
" цвет столбца - ctermbg
highlight ColorColumn ctermbg=darkblue
" автоотступы для новых строк
set ai
" отступы в стиле Си
set cin
" поддержка мыши
set mouse=a
" запуск NERDTree при старте
autocmd VimEnter * NERDTree
" активное правое окно
autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.o$' ,'\~$']

set keymap=russian-jcukenwin
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan


"############################## Подсветка #################################
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"################################# Ack ####################################
" опции поиска
let g:ack_default_options = " "
"--ignore-file=match:tags
"
"################################# Airline ####################################
" всегда показывать строку статуса
set laststatus=2
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
" настройки Vim-Airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_section_b = '%{strftime("%c")}'
let g:airline_powerline_fonts = 1

"################################# Unite ####################################
" настройка Unite
" автоматический insert mode
let g:unite_enable_start_insert = 1
" отображаем Unite в нижней части экрана
let g:unite_split_rule = "botright"
" отключаем замену статус строки
let g:unite_force_overwrite_statusline = 0
" размер окна 
let g:unite_winheight = 10
" красивые стрелочки
let g:unite_candidate_icon="▶"
" свое меню unite
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.mymenu = {
            \     'description' : 'My Unite menu',
            \ }
let g:unite_source_menu_menus.mymenu.candidates = {
            \   'mru&buffer'      : 'Unite buffer file_mru',
            \   'tag'      : 'Unite tag',
            \   'file'      : 'Unite file',
            \   'file_rec'      : 'Unite file_rec',
            \   'file_rec/async'      : 'Unite file_rec/async',
            \   'find'      : 'Unite find',
            \   'grep'      : 'Unite grep',
            \   'register'      : 'Unite register',
            \   'bookmark'      : 'Unite bookmark',
            \   'output'      : 'Unite output',
            \ }
function g:unite_source_menu_menus.mymenu.map(key, value)
		return {
			\   'word' : a:key, 'kind' : 'command',
			\   'action__command' : a:value,
		 	\ }
endfunction

"############################## NeoBundle #################################

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim directory

if dein#load_state(expand('~/.vim/dein')) " path to plugin base path directory
  call dein#begin('~/.vim/dein/repos/github.com/Shougo/dein.vim') " path to dein.vim directory

" call dein#add() " path to plugin base path directory
  call dein#add('Shougo/unite.vim')
" call dein#add('Shougo/vimproc.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('motemen/git-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-scripts/tComment')
  call dein#add('mileszs/ack.vim')
" call dein#add('dahu/vim-asciidoc')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('yegappan/grep')
" call dein#add('Valloric/YouCompleteMe')
  call dein#add('vim-airline/vim-airline')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"############################## Key maps ##################################
" запрет использования стрелок
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" сохранение буфера в файл
" nmap <C-s> :update<CR>
" vmap <C-s> <Esc><c-s>gv
" imap <C-s> <Esc><c-s>

" <F1>
nmap <F1> <>
vmap <F1> <>
imap <F1> <>

" сохранение буфера по <F2>
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

" поиск ack-grep по <F3>
" nmap <F3> <Esc>:Ack ''<Left>
" vmap <F3> <Esc>:Ack ''<Left>
" imap <F3> <Esc><Esc>:Ack ''<Left>
nmap <F3> <Esc>:Rgrep ''<Left>
vmap <F3> <Esc>:Rgrep ''<Left>
imap <F3> <Esc><Esc>:Rgrep ''<Left>

" просмотр списка буферов по <F4>
nmap <F4> <Esc>:Unite buffer<CR>
vmap <F4> <Esc>:Unite buffer<CR>
imap <F4> <Esc><Esc>:Unite buffer<CR>

" Предыдущий буфер <F5>
map <F5> :bp<CR>
vmap <F5> <Esc>:bp<CR>i
imap <F5> <Esc>:bp<CR>i

" следующий буфер <F6>
map <F6> :bn<CR>
vmap <F6> <Esc>:bn<CR>i
imap <F6> <Esc>:bn<CR>i

" переключение NERDTree <F8>
map <F8> :NERDTreeToggle<CR> 

" unite по <F9>
nmap <F9> <Esc>:Unite<CR>
vmap <F9> <Esc>:Unite<CR>
imap <F9> <Esc><Esc>:Unite<CR>

" unite mymenu по <F9>
nmap <A-F9> <Esc>:Unite menu:mymenu<CR>
vmap <A-F9> <Esc>:Unite menu:mymenu<CR>
imap <A-F9> <Esc><Esc>:Unite menu:mymenu<CR>

" выход по <F10>
nmap <F10> <Esc>:q<CR>
vmap <F10> <Esc>:q<CR>
imap <F10> <Esc><Esc>:q<CR>

" выход без сохранения по <F12>
nmap <F12> <Esc>:q!<CR>
vmap <F12> <Esc>:q!<CR>
imap <F12> <Esc><Esc>:q!<CR>

" переключение табов (вкладок) с помощью SHIFT+TAB и CTRL+TAB
map <S-TAB> :tabprevious<CR>
nmap <S-TAB> :tabprevious<CR>
imap <S-TAB> <Esc>:tabprevious<CR>i
map <C-TAB> :tabnext<CR>
nmap <C-TAB> :tabnext<CR>
imap <C-TAB> <Esc>:tabnext<CR>i

" открытие\закрытие новой вкладки по CTRL+T и CTRL+W
" nmap <C-t> :tabnew<CR>
" imap <C-t> <Esc>:tabnew<CR>a
" nmap <C-w> :tabclose<CR>
" imap <C-w> <Esc>:tabclose<CR>


"############################## AsciiDoc ##################################
" http://www.methods.co.nz/asciidoc/chunked/ape.html

" Use bold bright fonts.
" set background=dark

" Show tabs and trailing characters.
"set listchars=tab:»·,trail:·,eol:¬
set listchars=tab:»·,trail:·
set list

" Reformat paragraphs and list.
nnoremap <Leader>r gq}

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ textwidth=70 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

"########## Автодобавление макроса включения в заголовочный файл###########
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . ""
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()"
