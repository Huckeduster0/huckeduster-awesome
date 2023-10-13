# !/bin/bash

# installing and fetching nala
sudo apt install nala -y 
sudo nala fetch 

# installing all packages in packages file 
sudo nala install $(grep -vE "^\s*#" packages | tr "\n" " ")
