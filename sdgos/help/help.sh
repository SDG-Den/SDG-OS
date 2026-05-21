#!/bin/bash

CMD=""
SELECTED=$(ls ~/.config/sdgos/help/topics | fzf --layout=reverse --preview-window 'right:70%:wrap' --preview="clear && bat ~/.config/sdgos/help/topics/{}")