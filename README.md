# livedown.vim

A Vim plugin for [Livedown](https://github.com/shime/livedown).

![](https://twobucks.co/assets/livedown.gif)

## Installation

First make sure you have [node](http://nodejs.org/) with [npm](https://www.npmjs.org/) installed.

If you have node do

    $ npm install -g livedown

Then install this plugin with your preferred installation method. I recommend installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and then simply copy and paste

    $ git clone git://github.com/shime/vim-livedown.git ~/.vim/bundle/vim-livedown

## Usage

The following commands are available

```vimscript
" launch the Livedown server and preview your markdown file
:LivedownPreview

" stop the Livedown server
:LivedownKill

" launch/kill the Livedown server
:LivedownToggle
```

Bonus points for setting your own mapping

```vimscript
nmap gm :LivedownToggle<CR>
```

## Configuration

There are several configuration variables you can customize to suit your needs, with the following defaults.

```vimscript
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "safari"
```

## License

MIT
