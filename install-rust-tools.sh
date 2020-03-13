#/bin/bash

set -e

rustup toolchain add nightly
curl -fsSL https://starship.rs/install.sh | bash

#ls replacement
cargo install exa
# ps replacement
cargo install procs
# cat replacement
cargo install bat
# ripgrep replacement
cargo install ripgrep
# nano replacement
cargo install kibi
# find replacement
cargo install fd-find
# du replacement
cargo install du-dust
# hyperfine: benchmarking tool
cargo install hyperfine
# ytop - top replacement
cargo install -f --git https://github.com/cjbassi/ytop ytop
# bandwhich:
cargo install bandwhich
# hexdump replacement
cargo install hx
# bingrep
cargo install bingrep
# miniserve: simple http server
cargo +nightly install -f miniserve
# Generate licenses
cargo install licensor
