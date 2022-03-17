"" Last update: 17.03.2022 21:43

"=====================================================
"VUNDLE SETTINGS
">>>==================================================

set nocompatible             " be iMproved, required
filetype off                 " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin  'VundleVim/Vundle.vim'

"Плагин предназначен для перемещения текущей строки или
"выделенных строк вверх или вниз.
Plugin  'matze/vim-move'

"Плагин ставит отступы между любыми скобками или кавычками.
Plugin  'Raimondi/delimitMate'

Plugin  'vim-airline/vim-airline'
Plugin  'powerline/fonts'
Plugin  'vim-airline/vim-airline-themes'
Plugin  'bling/vim-bufferline'

"меню последних открытых файлов
Plugin 'yegappan/mru'

"Подстветка парных html, xml тегов
"Подсвечивает парный тэг при наведении
Plugin  'gregsexton/MatchTag'

Plugin  'Chiel92/vim-autoformat'

"Переход к парному тегу - жмём %
"Переход к парному тегу - жмём %
Plugin  'tmhedberg/matchit'

Plugin 'alvan/vim-closetag'
"Редактирование текста сразу в нескольких местах
Plugin  'terryma/vim-multiple-cursors'

"дерево изменений
Plugin 'mbbill/undotree'

"миленький стартовый экран
Plugin  'mhinz/vim-startify'

Plugin  'jlanzarotta/bufexplorer'
" Plugin  'scrooloose/nerdcommenter'
Plugin  'tpope/vim-commentary'
Plugin  'scrooloose/nerdtree'

" snipmate - сниппеты
" vim-addon-mw-utils - требуется для работы snipmate
" tlib_vim - требуется для работы snipmate
" vim-snippets - для работы snipmate ( опционально )
Plugin  'garbas/vim-snipmate'
Plugin  'MarcWeber/vim-addon-mw-utils'
Plugin  'tomtom/tlib_vim'
" Optional:
Plugin  'honza/vim-snippets'

Plugin  'lpenz/vimcommander'

Plugin  'aperezdc/vim-template'

Plugin  'tpope/vim-surround'

"indicate changes of a buffer
Plugin  'vim-scripts/changesPlugin'

Plugin 'haya14busa/incsearch.vim'

"репозитории vim/scripts
" 'L9' требуется для работы 'FuzzyFinder'
Bundle 'L9'
Bundle 'FuzzyFinder'

"Bundle 'rails.vim'

"git репозитории (не на github)
"Bundle 'git://git.wincent.com/command-t.'

"локальные git репозитории(если работаете над собственным плагином)
"Bundle 'file:///Users/gmarik/path/to/plugin'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate     - update
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"VUNDLE SETTINGS
"<<<==========================================================

"==============================================================
"РАЗНЫЕ НАСТРОЙКИ
">>>===========================================================

if has('gui_running')
  "размер окна в gui при запуске
  au GUIEnter * :set lines=55 columns=110
  autocmd GUIEnter * set visualbell t_vb=
  set guifont=Monospace\ 12
  set guicursor=n-v-c:block-Cursor-blinkon0
  set guicursor+=ve:ver35-Cursor
  set guicursor+=o:hor50-Cursor-blinkwait175-blinkoff150-blinkon175
  set guicursor+=i-ci:ver20-Cursor-blinkon0
  set guicursor+=r-cr:hor20-Cursor
  set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

  highlight CursorLine guibg=lightblue ctermbg=lightgray
  highlight CursorLine term=none cterm=none

  " Paste from CLIPBOARD
  inoremap <silent> <M-v> <Esc>"+p`]a
endif


"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[6 q" "SI = режим вставки
let &t_SR.="\e[4 q" "SR = режим замены
let &t_EI.="\e[2 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта

" Подсвечивать линию текста, на которой находится курсор
" может тормозить
set cursorline


"Цветовая схема
"colorscheme desert


let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

" fix for using in the screen
if match($TERM, "screen")!=-1
  set term=xterm
endif

" Выключаем звуковое оповещение о достижении конца буффера,
" невозможности действия и т.д.
set noerrorbells visualbell t_vb=

set confirm         " Включение диалогов с запросами

"Проблема красного на красном при spellchecking-е решается такой строкой
highlight SpellBad ctermfg=Black ctermbg=Red

" Просмотр нетекстовых файлов в Vim
" au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
" au BufReadPost *.doc silent %!antiword "%"
" au BufReadPost *.odt silent %!odt2txt "%"

"Включаем bash-like дополнение имён файлов по нажатию на Tab:
"вывести весь список сразу доступных вариантов, а затем перебором
set wildmode=list:longest,full

" Следующая опция делает так, чтобы рабочей папкой становилась директория,
" в которой расположен открытый файл.
" Это практически обязательная опция для отладки скриптов на Python.
" Автоматическое переключение рабочей папки
set autochdir


"Использовать иксовый буфер как основной, во избежание лишней путаницы
set clipboard=unnamed

" Не выгружать буфер, при переключении на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden

set number relativenumber

"Включение относительной нумерации строк.
"Пока не разобрался, что это такое
"set relativenumber

set numberwidth=5       "Количество колонок, которое занимает нумерация на экране
set mousehide           "Спрятать курсор мыши когда набираем текст
set mouse=a             "Включить поддержку мыши

" сколько строк внизу и вверху экрана показывать при скроллинге
set scrolloff=2

"Эта опция определяет где в режиме Вставки кнопка <BS> может удалять символ перед курсором.
"Перечисленные через запятую значения позволяют Vim удалять пробелы в начале строки,
"символы переноса строки и символ, перед которым был осуществлён переход в режим Вставки.
" set backspace=indent,eol,start
set backspace=indent,eol,start whichwrap+=<,>,[,]


"отображение скрытых символов, таких как символы табуляции и перевод строки и т.д
" set list

" Настраиваем отображения скрытых символов, при включении их отображения:
" tab - два символа для отображения табуляции (первый символ и заполнитель)
" eol - символ для отображения конца строки
" precedes - индикатор продолжения строки в лево
" extends - индикатор продолжения строки в право
" trail - концевые пробелы
" далее по коду определена комбинация для включения и отключения
" скрытых символов (<leader>l)
set listchars=tab:▸·,eol:¬,precedes:«,extends:»,trail:-,nbsp:×

" Вырубаем черточки на табах
set showtabline=1

"комбинация leader + l для включения и выключения не отображаемых символов,
" так как они не всегда нужны, а иногда даже мешают редактированию.
nmap <leader>l :set list!<CR>

"set autoread           "Перечитывать изменённые файлы автоматически

"Автоматически перечитывать конфигурацию VIM после сохранения
"autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"set autowrite   " сохранить файл перед выполнением команды

" Перед сохранением .vimrc обновлять дату последнего изменения
autocmd! BufWritePre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))

"Удалить пробелы в конце строк (frantsev)
function! RemoveTrailingSpaces()
  normal! mzHmy
  execute '%s:\s\+$::ge'
  normal! 'yzt`z
endfunction

" убираем конечные пробелы при сохранении любого типа файла
autocmd BufWritePre * call RemoveTrailingSpaces()

"Показывает изменения в файле. После правки, если нужно просмотреть изменения,
"вводим команду ":DiffOrig"
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

"установите курсор в любом месте на ключевом слове и просто нажмите "К". Вы
"перейдете на страницу помощи по этому слову. Эта ссылка позволяет избежать
"необходимости вводить ":help" и ключевое слово
let &keywordprg=':help'

"<<<========================================================
"РАЗНЫЕ НАСТРОЙКИ
"<<<========================================================


">>>========================================================
"РАбОТА С бУФЕРАМИ
">>>========================================================

set browsedir=buffer      " Начинать обзор с каталога текущего буфера

"tab sball

"Эта опция управляет поведением редактора при переключении между буферами.
" Значение опции представляет собой разделённый запятыми список ключевых слов:
"'useopen' позволяет перемещаться в первое открытое окно,
" которое содержит указанный буфер, если такое имеется.
" Если это ключевое слово отсутствует в значении данной опции,
" то другие окна не будут приниматься во внимание.
" Это значение также проверяется при выполнении команд |быстрого_исправления|,
" при переходе между ошибками (":cc", ":cn", "cp" и т.д.).
"Кроме того, это значение используется во всех связанных с буферами командах разделения,
"таких как ":sbuffer", ":sbnext" и ":sbrewind".
"'split' это ключевое слово позволяет разделять текущее окно перед загрузкой нового буфера.
"Если оно отсутствует в списке, то буфер загружается в активное окно.
set splitright
set splitbelow

"Значение поддерживается командами |быстрого_исправления|, которые позволяют перемещаться между ошибками в текстах программ.
set switchbuf=useopen


" CTRL+F5 - просмотр списка буферов
nmap <C-F5> <Esc>:buffers<cr>
vmap <C-F5> <esc>:buffers<cr>
imap <C-F5> <esc><esc>:buffers<cr>a

" ALT-F5 - предыдущий буфер
map <A-F5> :bp<cr>
vmap <A-F5> <esc>:bp<cr>i
imap <A-F5> <esc>:bp<cr>i

" ALT-F6 - следующий буфер
map <A-F6> :bn<cr>
vmap <A-F6> <esc>:bn<cr>i
imap <S-F6> <esc>:bn<cr>i


"При использовании авто-дополнения в командной строке
"показывать доступные варианты над командной строкой.
set wildmenu
set wcm=<Tab>
menu Bumper.Open_buffer   :Vex!<CR>
menu Bumper.Close_buffer  :bd<CR>
menu Bumper.List_buffer   :ls<CR>
map <S-F4> :emenu Bumper.<Tab>

" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
" the right side. Ctrl-Shift-Tab goes the other way.
noremap <C-Tab> :bn<CR>
noremap <C-S-Tab> :bp<CR>
"<<<==========================================================
"РАбОТА С бУФЕРАМИ
"<<<==========================================================



"============================================================
"ИСТОРИЯ, СЕССИИ, ОТМЕНА, РЕЗЕРВНЫЕ КОПИИ
">>>=========================================================
if isdirectory($HOME . '/.vim/cache') == 0
  :silent !mkdir -p ~/.vim/cache >/dev/null 2>&1
endif

" автоматически сохраняем сессию перед выходом
autocmd VimLeave * :mksession! ~/.vim/vim.lastsession
set history=300     " хранить больше истории команд
set undolevels=2048 " хранить историю изменений числом N
set undofile                "включить "вечную" отмену изменений
if isdirectory($HOME . '/.vim/cache/undo') == 0
  :silent !mkdir -p ~/.vim/cache/undo >/dev/null 2>&1
endif
set undodir=~/.vim/cache/undo/    "директория для файлов с историей изменений
set undoreload=10000

" в(ы)ключить сохранение резервных копий
set nobackup

set nowritebackup
" не использовать своп-файл (внего скидываются открытые буферы)
set noswapfile

set viminfo+=n~/.vim/cache/viminfo

"ИСТОРИЯ, СЕССИИ, ОТМЕНА, РЕЗЕРВНЫЕ КОПИИ
"<<<==================================================================



"=================================================================
"СТРОКА СОСТОЯНИЯ
">>>==============================================================

"Определяет, имеет ли единственное окно на экране строку статуса.
"Значение 2 указывает, что строка статуса всегда должна показываться
set laststatus=2

"" Формат строки состояния
" fileformat - формат файла (unix, dos); fileencoding - кодировка файла;
" encoding - кодировка терминала; TYPE - тип файла, затем коды символа под курсором;
" позиция курсора (строка, символ в строке); процент прочитанного в файле;
" кол-во строк в файле;
" set statusline=%F%m%r%h%w\ [%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set showcmd             "Показывать незавершенные команды в статусбаре (автодополнение ввода)

set title               " показывать имя буфера в заголовке терминала

"СТРОКА СОСТОЯНИЯ
"<<<================================================================


"===================================================
"ОТСТУПЫ, ПЕРЕНОСЫ, ФОРМАТИРОВАНИЕ
">>>================================================
" иногда при вставке текста в редактор не сохраняется форматирование и
" в редакторе появляется какая то белиберда.
" Что бы этого избежать добавьте в vimrc строку
" Эта опция в консоли мешает работать snipmate по табу
" set paste

" При вставке фрагмента сохраняет отступ
set pastetoggle=
set shiftwidth=4    " размер отступов (нажатие на << или >>)
set tabstop=4       " ширина табуляции
set softtabstop=4   " 4 пробела в табе - ширина 'мягкого' таба
set autoindent      " ai - включит автоотступы (копируется отступ предыдущей строки)
"set cindent         " ci - отступы в стиле С
"set expandtab       " Ставим табы пробелами
set smartindent     " Умные отступы (например, автоотступ после {)
set smarttab
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8
"
"Переносим на другую строчку, разрываем строки
set wrap                " (no)wrap - динамический (не)перенос длинных строк
set linebreak           " переносить целые слова
set dy=lastline

"<<<==============================================================
"ОТСТУПЫ, ПЕРЕНОСЫ, ФОРМАТИРОВАНИЕ
"<<<==============================================================

"======================================================================
"ПОИСК
">>>===================================================================

" Use ripgrep over grep
if executable('rg')
  set grepprg=set grepprg=rg\ --no-heading\ --vimgrep
endif

"подсвечивает все слова, которые совпадают со словом под курсором.
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
" Подсветка всех слов под курсором
"autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
"НАСТРОЙКИ ПОИСКА ТЕКСТА В ОТКРЫТЫХ ФАЙЛАХ
set ignorecase          " ics - поиск без учёта регистра символов

" если искомое выражения содержит символы в верхнем регистре -
" ищет с учётом регистра, иначе - без учёта
set smartcase
" (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
set hlsearch
" поиск фрагмента по мере его набора
set incsearch

"" Поиск выделенного текста (frantsev.ru/configs/vimrc.txt)
function! VisualSearch()
  let l:old_reg=getreg('"')
  let l:old_regtype=getregtype('"')
  normal! gvy
  let @/=escape(@@, '$.*/\[]')
  normal! gV
  call setreg('"', l:old_reg, l:old_regtype)
endfunction

" поиск выделенного текста (начинать искать фрагмент при его выделении)
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>/<C-R>/<CR>

" Disable higlighting search result on Enter key
" Выключаем подсветку результатов поиска по клавише "enter"
nnoremap <silent> <cr> :nohlsearch<cr><cr>



"ПОИСК
"<<<====================================================================


"==================================================================
"КОДИРОВКИ ТЕКСТА (utf8, cp1251, koi8-r, cp866)
"ПРОВЕРКА ОРФОГРАФИИ
">>>===============================================================

set encoding=utf-8 " Кодировка файлов по умолчанию
" Кодировка терминала, должна совпадать с той,
" которая используется для вывода в терминал
set termencoding=utf-8

" Список используемых кодировок для автоматического их определения
" Параметру fileencodings присваиваем список используемых
" в повседневной жизни кодировок.
" Теперь при открытии файла все сразу будет выводиться в правильной кодировке.
set fileencodings=utf-8,cp1251,koi8-r,ucs-2,cp866
"
set fileformat=unix          " Формат файла по умолчанию
set fileformats=unix,dos,mac " Порядок определения формата файла
"
"" Переключение кодировок файла
" Меню Encoding -->
" Выбор кодировки, в которой читать файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Read.utf-8 :e ++enc=utf8 <CR>
menu Encoding.Read.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.Read.latin1 :e ++enc=latin1 <CR>
menu Encoding.Read.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.Read.cp866 :e ++enc=cp866<CR>
menu Encoding.Read.koi8-u :e ++enc=koi8-u <CR>
map <Tab><F7> :emenu Encoding.Read.<TAB>
" Выбор кодировки, в которой читать файл <--
"
"
" Выбор кодировки, в которой сохранять файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Write.utf-8 :set fenc=utf8<CR>
menu Encoding.Write.windows-1251 :set fenc=cp1251<CR>
menu Encoding.Write.latin1 :set  fenc=latin1<CR>
menu Encoding.Write.koi8-r :set fenc=koi8-r<CR>
menu Encoding.Write.cp866 :set fenc=cp866<CR>
menu Encoding.Write.koi8-u :set fenc=koi8-u<CR>
map <Tab><F8> :emenu Encoding.Write.<TAB>
" Выбор кодировки, в которой сохранять файл <--
"
" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
set wildmenu
set wcm=<Tab>
menu Encoding.End_line_format.unix :set fileformat=unix<CR>
menu Encoding.End_line_format.dos :set fileformat=dos<CR>
menu Encoding.End_line_format.mac :set fileformat=mac<CR>
map <Tab><F9> :emenu Encoding.End_line_format.<TAB>
" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
" Меню Encoding <--
"
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
"
"
"========== проблема с русской раскладкой ===========
"Переключение между раскладками ( ru-en ) происходит по нажатию CTRL + ^
"Переключение производится в режиме вставки
set keymap=russian-jcukenwin
" по умолчанию - латинская раскладка
set iminsert=0
" по умолчанию - латинская раскладка при поиске
set imsearch=0

" Проверка орфографии -->
if version >= 700
  " По умолчанию проверка орфографии выключена.
  set spell spelllang=
  set nospell
  menu Spell.off :setlocal spell spelllang=<CR>:setlocal nospell<CR>
  menu Spell.Russian+English :setlocal spell spelllang=ru,en<CR>
  menu Spell.Russian :setlocal spell spelllang=ru<CR>
  menu Spell.English :setlocal spell spelllang=en<CR>
  menu Spell.-SpellControl- :
  menu Spell.Word\ Suggest<Tab>z= z=
  menu Spell.Add\ To\ Dictionary<Tab>zg zg
  menu Spell.Add\ To\ TemporaryDictionary<Tab>zG zG
  menu Spell.Remove\ From\ Dictionary<Tab>zw zw
  menu Spell.Remove\ From\ Temporary\ Dictionary<Tab>zW zW
  menu Spell.Previous\ Wrong\ Word<Tab>[s [s
  menu Spell.Next\ Wrong\ Word<Tab>]s ]s
endif
" Проверка орфографии <--
"
"КОДИРОВКИ ТЕКСТА
"ПРОВЕРКА ОРФОГРАФИИ
"<<<=========================================================


"=============================================================
"РАБОТА С КОДОМ
">>>==========================================================

syntax on "Включить подсветку синтаксиса

au BufRead,BufNewFile /var/log/*.*  set filetype=messages
au BufRead,BufNewFile /etc/*.*      set filetype=gentoo-conf-d

"Опции авто-дополнения
"set completeopt=menu
set completeopt=longest,menuone

"искать теги в текущй директории и в указанной (теги генерируются ctags)
set tags=tags\ $VIMRUNTIME/systags

set lazyredraw                  "Не перерисовывать окно при работе макросов

" при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
  autocmd!
  autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=#c12a0f
  autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
  autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END


set matchpairs+=<:>         " показывать совпадающие скобки для HTML-тегов
set showmatch               " показывать первую парную скобку после ввода второй

" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1

" --- Clojure ---
autocmd FileType clj setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */


" --- Erlang ---
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete


" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1


" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->


" --- Rust ---
let g:racer_cmd = "~/racer/bin/racer"
let $RUST_SRC_PATH = "~/rust/src"
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s


" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2


" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1


"=============================================================

"=============================================================
"=============== Что касается Python =========================
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"let python_highlight_exceptions=0
"let python_highlight_builtins=0
"let python_slow_sync=1

" следующее рекомендуется в help по jedi-vim
autocmd FileType python setlocal completeopt-=preview

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" для этого у нас jedi-vim
"autocmd FileType python set omnifunc=pythoncomplete#CompletePython


" Показываем все полезные опции автокомплита сразу
"set complete=""
"set complete+=.
"set complete+=k
"set complete+=b
"set complete+=t

"<<<==========================================================
"РАБОТА С КОДОМ
"<<<==========================================================


">>>==========================================================
"НАСТРОЙКА ПЛАГИНОВ
">>>==========================================================

"====================== Omni completion ======================
"========================== build in =========================
"       :help ins-completion
"       <C-n>       and
"       <C-p>       will complete what is in all buffers
"       <C-x><C-n>  and
"       <C-x><C-p>  only give completion for tokens in the current buffer
"       <C-x><C-f>  to complete file paths
"       <C-x><C-l>  to complete entire lines
set omnifunc=syntaxcomplete#Complete

"========= vim-airline — строка статуса/состояния ==========
"================= vim-airline-themes ======================
"================= powerline/fonts =========================
"================== vim-bufferline =========================
"=============== установлен через Vundle ===================
"Плагин отображает удобную строку статуса, которую легко кастомизировать под свои нужды.
"Также можно позволить плагину управлять внешним видом вкладок.
"Для корректной работы нужны пропатченные шрифты,которые вы можете взять отсюда - https://github.com/powerline/fonts.
set laststatus=2
"let g:airline_theme='dark'
let g:airline_theme='solarized'
"
" let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
"
"the separator used on the left side >
let g:airline_left_sep='>'
"the separator used on the right side >
let g:airline_right_sep='<'
"
"enable modified detection >
"let g:airline_detect_modified=1
"
"enable spell detection >
let g:airline_detect_spell=1
"
"enable/disable bufferline integration
let g:airline#extensions#bufferline#enabled = 1
"determine whether bufferline will overwrite customization variables
let g:airline#extensions#bufferline#overwrite_variables = 1
"
"
"solarized не входит в стандартную поставку, необходимо загрузить набор тем
"let g:airline_theme='solarized'
"
"использовать пропатченные шрифты
let g:airline_powerline_fonts = 1
"
"включить управление табами
let g:airline#extensions#tabline#enabled = 1
"всегда показывать tabline
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
"если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'
"
"let g:airline#extensions#tabline#show_buffers = 0      "скрыть буферы
"
"имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'
"
"убираем раздражающие ненужные красные панели с предупреждениями или ошибками.
"Предупреждения, как по мне, не нужны, поскольку ругаются
"даже на trailing-spaces и разные отступы: например табы и пробелы
"(привет от phpDoc). Для ошибок и так открывается дополнительное окно.
"Впрочем, вам решать.
let g:airline_section_warning = ''
let g:airline_section_error = ''
"
"убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 0
"
"убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''
"
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0             "отключаем tagbar
"
let g:airline#extensions#tabline#show_tab_nr = 1        "показывать номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1        "показывать только номер вкладки



"================== Nscrooloose/nerdcommente =================
"============= быстроое комментирование блоков кода ==========
"============ вместо него поставил tpope/vim-commentary ======
"смотри :help nerdcommenter
"<leader> + cc - закомментировать
"<leader> + c + space - раскомментировать
"клавиша <leader> на данный момент = '\'
"но можно изменить следующей командой
"set mapleader = ","
"количество пробелов после символа(ов) комментария
" let g:NERDSpaceDelims = 1


"=================== tpope/vim-commentary ====================
"============= быстроое комментирование блоков кода ==========
" Comment stuff out. Use
      " gcc to comment out a line (takes a count),
      " gc to comment out the target of a motion (for example, gcap to comment out a paragraph),
      " gc in visual mode to comment out the selection, and
      " gc in operator pending mode to target a comment.
" You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.

    " My favorite file type isn't supported!
" Relax! You just have to adjust 'commentstring':
" autocmd FileType apache setlocal commentstring=#\ %s



"============ NERDTree — навигация по файлам/директориям =====
"=================== установлен через Vundle =================
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
"автоматически обновлять буфер после переименовывания файла
let NERDTreeAutoDeleteBuffer = 1
" автоматически отображать при запуске vim
"autocmd vimenter * NERDTree



"============ terryma/vim-multiple-cursors =================
"============== установлен через Vundle ====================
"    Редактирование текста сразу в нескольких местах
"За примерами сходить по ссылке
"https://github.com/terryma/vim-multiple-cursors/issues/39
"
"выделить все вхождения
":MultipleCursorsFind pattern
" Default mapping
" выделение следующего слова под курсором
"let g:multi_cursor_next_key='<C-n>'
"
" выделение предыдущего слова под курсором
"let g:multi_cursor_prev_key='<C-p>'
"
"пропустить текущее слово и перейти к следующему
"let g:multi_cursor_skip_key='<C-x>'
"
"let g:multi_cursor_quit_key='<Esc>'
"
" После того, как вы выделили все слова, можно приступить к редактированию:
"         c - удалить и перейти в режим редактирования
"         I - вставить в начало
"         A - вставить в конец



"======================== changesPlugin =========================
"==================indicate changes of a buffer =================
" :EC  - Active the plugin (displays indicators of changes for the current buffer)
" :DC  - Disable the plugin
" :TCV - Toggles the plugin
" :CC  - Show a small help window
" :CL  - Opens the Quickfix window with all changes for the current buffer
" :CD  - Opens a diff view for the current buffer
" :CF  - Folds away all non-changed lines
" :CT  - Toggles how the highlighting is displayed
" ]h   - Moves forward to the next changed line
" [h   - Moves backwards to the previous changed line
" ah   - Selects the current hunk (TextObject)
" <Leader>h - Stage the hunk, the cursor is on (works only for git)
let g:changes_hl_lines=1
let g:changes_autocmd=1
" let g:changes_diff_preview=1
let g:changes_linehi_diff=1



"============ bufexplorer - Работа с буферами =================
"================ установлен через Vundle =====================
nnoremap <silent> <F5> :BufExplorer<CR>
nnoremap <silent> <leader>bt :ToggleBufExplorer<CR>
nnoremap <silent> <leader>bh :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <leader>bv :BufExplorerVerticalSplit<CR>
let g:bufExplorerDefaultHelp=1       " Show default help
let g:bufExplorerDisableDefaultKeyMapping=0 "Do not disable mapping
let g:bufExplorerDetailedHelp=1      " Show detailed help.
let g:bufExplorerFindActive=1        " Go to active window.
let g:bufExplorerShowRelativePath=1  " Show absolute paths
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.



"=====================  Chiel92/vim-autoformat ================
"================= установлен через Vundle ====================
noremap <S-F2> :Autoformat<CR>
set wildmenu
set wcm=<Tab>
menu Plugin.Autoformat.Autoformat  :Autoformat<CR>
menu Plugin.Autoformat.help         :help Autoformat<CR>



"========= mru - меню последних открытых файлов ===============
"======= установлен через Vundle ==============================
let MRU_Max_Entries = 200
let MRU_Window_Height = 15
let MRU_Auto_Close = 1
let MRU_Max_Menu_Entries = 20
let MRU_File = '~/.vim/cache/vim_mru_files'
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'




"===================== alvan/vim-closetag ==================
"============== установлен через Vundle ====================
"filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"



"======================= vimcommander =========================
"=================== установлен через Vundle ==================
noremap <silent> <F9> :cal VimCommanderToggle()<CR>



"===================== mbbill/undotree ==========================
"================= установлен через Vundle ======================
"                    дерево изменений
nnoremap <S-F5>  :UndotreeToggle<CR>



"=================== snipmate ==============================
"============== установлен через Vundle ====================
"особых настроек, в принципе, и не надо
"сниппеты хранятся в папке ~/.vim/snippets
"дополнение по клавише tab

"The legacy parser, version 0, is deprecated. It is currently still the default
"parser, but that will be changing. NOTE that switching which parser you use
"could require changes to your snippets--see the previous section.

let g:snipMate = { 'snippet_version' : 1 }


"=======================  tpope/vim-surround ====================
"==================== установлен через Vundle ===================
"Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
"The plugin provides mappings to easily delete, change and add such surroundings in pairs.
":help surround



"============ vim-move - перемещение строк вверх-вниз =========
"================= установлен через Vundle ====================
"Перемещаем выделенные строки клавишами Alt+j и Alt+k
" Нижеследующая строка меняет клавишу-модификатор с Alt на Ctrl
" let g:move_key_modifier = 'C'



"======================= delimitmate =========================
"================= установлен через Vundle ===================
"Плагин ставит отступы между любыми скобками или кавычками
"включить отступы по нажатию на enter
let delimitMate_expand_cr = 1
"включить отступы по нажатию на пробел. "         |" превращается в "         | "
let delimitMate_expand_space = 1
"для html, необходимо дописать >:<, чтобы выставлялись правильные отступы
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>,>:<"


"================= Bundle 'FuzzyFinder' =====================
"================= Bundle 'L9' ==============================
"============= 'L9' требуется для работы 'FuzzyFinder' ======
"============== установлено из репозитория vim/scripts ======
" USAGE                                                              *fuf-usage*
" You can launch FuzzyFinder by the following commands:
"          Command           Mode ~
"         |:FufBuffer|       - Buffer mode (|fuf-buffer-mode|)
"         |:FufFile|         - File mode (|fuf-file-mode|)
"         |:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|)
"         |:FufDir|          - Directory mode (|fuf-dir-mode|)
"         |:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|)
"         |:FufMruCmd|       - MRU-Command mode (|fuf-mrucmd-mode|)
"         |:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|)
"         |:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)
"         |:FufTag|          - Tag mode (|fuf-tag-mode|)
"         |:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|)
"         |:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|)
"         |:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|)
"         |:FufChangeList|   - Change-List mode (|fuf-changelist-mode|)
"         |:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|)
"         |:FufLine|         - Line mode (|fuf-line-mode|)
"         |:FufHelp|         - Help mode (|fuf-help-mode|)

" It is recommended to map these commands.
" These commands open 1-line buffer to enter search pattern and start insert
" mode.

"         <C-w> deletes one block of an entered pattern before the cursor, like a directory name.
"         <C-s> (|g:fuf_keyPrevPattern|) and
"         <C-^> (|g:fuf_keyNextPattern|), You can recall patterns which have been entered before from history.

" You can open a selected item in various ways:
"         <CR>  (|g:fuf_keyOpen|)        - opens in a previous window.
"         <C-j> (|g:fuf_keyOpenSplit|)   - opens in a split window.
"         <C-k> (|g:fuf_keyOpenVsplit|)  - opens in a vertical-split window.
"         <C-l> (|g:fuf_keyOpenTabpage|) - opens in a new tab page.

"         <C-\><C-\> (|g:fuf_keySwitchMatching|) switch search method between fuzzy matching and partial matching.
"         <C-t> (|g:fuf_keyNextMode|) and
"         <C-y> (|g:fuf_keyPrevMode|) switch current mode without leaving Insert mode .

"         <C-@> (|g:fuf_keyPreview|) can preview selected item in some modes.
" Repeating the key on the same item shows another information.
" The height of command-line area is changed to |g:fuf_previewHeight| when you launch a mode supporting preview.
" This feature is available when |g:fuf_previewHeight| is not 0.


"================= haya14busa/incsearch.vim =======================
"       <Tab>   to next match
"       <S-Tab> to prev match
"       <C-j>   scroll to the next page match
"       <C-k>   scroll to the previous page match

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"<<<====================================================================
"НАСТРОЙКА ПЛАГИНОВ
"<<<====================================================================


"==============================================================
"========= Горячие клавиши и дополнительные меню ==============

"Комбинация ",v" открытие .vimrc в вертикальном окошке
map ,v :vsp $MYVIMRC<CR>

" Backspace in Visual mode deletes selection
vnoremap <BS> d



nnoremap <leader>bd   :bd<CR>




" Пример включения файла
" :source <sfile>:h/configs/vim-airline..._config







