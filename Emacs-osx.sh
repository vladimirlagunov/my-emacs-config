#!/bin/bash
# mv /Applications/Emacs.app/Contents/MacOS/Emacs{,.real}
# ln -s Emacs-osx.sh /Applications/Emacs.app/Contents/MacOS/Emacs
cd
source .profile
exec /Applications/Emacs.app/Contents/MacOS/Emacs.real "$@"
