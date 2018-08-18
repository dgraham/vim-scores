# A fast fuzzy file name matcher for Vim

A fast replacement for [CtrlP][]'s fuzzy file name matcher that
uses [`scores`][scores] to rank search results. This provides results
similar to [ctrlp-py-matcher][py] but without the Python dependency.

[scores]: https://github.com/dgraham/scores
[CtrlP]: https://github.com/ctrlpvim/ctrlp.vim
[py]: https://github.com/FelikZ/ctrlp-py-matcher

## Installation

```
# Build scores binary and install in $PATH
$ git clone https://github.com/dgraham/scores
$ cd scores
$ cargo build --release
$ cp target/release/scores /usr/local/bin
```

```
# Install the vim plugin
$ git clone https://github.com/dgraham/vim-scores ~/.vim/pack/plugins/start/vim-scores
```

Add the match function to your `~/.vimrc` file.

```vim
let g:ctrlp_match_func = { 'match': 'scores#ScoreMatch' }
```

## License

Distributed under the MIT license. See LICENSE for details.
