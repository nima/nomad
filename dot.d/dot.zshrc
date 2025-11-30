RAKHSH_HOME=$(realpath $(readlink ~/.zshrc.d/rakhsh.zshrc)/../..)

for rc in ${RAKHSH_HOME}/dot.d/dot.zshrc.d/*(N); do source "$rc"; done
