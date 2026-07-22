#!/bin/bash

curl -s --compressed "https://ctu-mrs.github.io/ppa2-testing/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg >/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/ctu-mrs-testing.list "https://ctu-mrs.github.io/ppa2-testing/ctu-mrs-apt.list"
sudo curl -s --compressed -o /etc/apt/preferences.d/ctu-mrs-testing-preferences "https://ctu-mrs.github.io/ppa2-testing/ctu-mrs-ppa-preferences.txt"

sudo apt-get update
