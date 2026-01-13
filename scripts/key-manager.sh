#!/usr/bin/env bash                               
                                                  
add_key() {                                       
  local keyName="$1"                              
  if [[ -f "$HOME/.ssh/$keyName" ]]; then         
    ssh-add "$HOME/.ssh/$keyName" > /dev/null 2>&1
  fi                                              
}                                                 
                                                  
main() {                                          
    eval "$(ssh-agent -s)" > /dev/null 2>&1       
    add_key "key-name"
}                                                 
                                                  
main                                              
