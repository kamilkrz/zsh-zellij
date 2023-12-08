
function _zellij_pane(){
    if [[ -n $ZELLIJ ]]; then 
      local name=$(echo $3 | cut -d' ' -f1)
      command nohup zellij action rename-pane $name >/dev/null 2>&1
    fi
}

function _zellij_pane_ls(){
    if [[ -n $ZELLIJ ]]; then 
      local current_dir=$PWD 
      if [[ $current_dir == $HOME ]]; then 
        current_dir="~" 
      else 
        current_dir=${current_dir##*/} 
      fi 
        command nohup zellij action rename-pane $current_dir >/dev/null 2>&1 
    fi
}

chpwd_functions=(${chpwd_functions[@]} "_zellij_pane_ls")
preexec_functions=(${preexec_functions[@]} "_zellij_pane")
precmd_functions=(${precmd_functions[@]} "_zellij_pane_ls")


