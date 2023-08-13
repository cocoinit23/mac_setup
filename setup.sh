# homebrew
# https://brew.sh/index_ja
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# essential
xcode-select --install
sudo softwareupdate --install-rosetta

# iCloud
ln -s "$HOME"/Library/Mobile\ Documents/com~apple~CloudDocs/ "$HOME"/iCloud
echo "alias icloud='cd $HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs'" >>"$HOME"/.zprofile

# display english name of home directories
rm ~/Applications/.localized
rm ~/Documents/.localized
rm ~/Downloads/.localized
rm ~/Desktop/.localized
rm ~/Public/.localized
rm ~/Pictures/.localized
rm ~/Music/.localized
rm ~/Movies/.localized
rm ~/Library/.localized

# commands
brew install coreutils
brew install watch
brew install wget
brew install tmux

# programming
# brew install --cask docker
# brew install postgresql
# brew install --cask pgadmin4
# brew install poetry
# brew install node

# applications
brew tap Homebrew/bundle
brew install --cask adobe-creative-cloud
brew install --cask microsoft-office
brew install --cask microsoft-teams
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask google-japanese-ime
brew install --cask iterm2
brew install --cask deepl
brew install --cask onyx
# brew install --cask bartender
brew install --cask bettertouchtool
brew install --cask alfred
brew install --cask appcleaner
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask vlc
# brew install --cask webex-meetings
brew install --cask skype
brew install --cask zoom
brew install --cask r
brew install --cask rstudio
brew install --cask mp3gain-express
# brew install --cask endnote
brew install --cask cheatsheet
brew install --cask balenaetcher
brew install --cask jetbrains-toolbox
# brew install --cask pycharm
# brew install --cask intellij-idea
brew install --cask android-file-transfer
# brew install --cask obs
brew install --cask anki
brew install --cask slack

# app store
brew install mas
mas install 1333542190 # 1Password
mas install 937984704  # Amphetamine
mas install 1444383602 # GoodNotes
# mas install 1319778037 # iStat Menus
mas install 472226235  # LanScan
mas install 539883307  # LINE
mas install 545519333  # Prime Video
# mas install 803453959  # Slack
mas install 425424353  # The Unarchiver
# mas install 1384080005 # Tweetbot
# mas install 882655968  # ZIPANG
mas install 1348617240 # FirstSeed Calendar
mas install 1258530160 # Focus To-Do

# python
brew install --cask miniforge
conda init
echo 'source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh' >>"$HOME"/.zprofile
source "$HOME"/.zprofile

conda create --name py38 python=3.8 -y
conda activate py38
echo 'conda activate py38' >>"$HOME"/.zshrc

# tensorflow for apple silicon
# https://developer.apple.com/metal/tensorflow-plugin/
conda install -c apple tensorflow-deps==2.10.0 -y
pip install tensorflow-macos==2.10.0 tensorflow-addons==0.18.0 tensorflow-metal==0.6.0 keras-cv-attention-models==1.3.1

# pytorch
conda install -c pytorch pytorch torchvision -y
# pip install torch torchvision

# hugging face
conda install -c huggingface transformers datasets -y
conda install -c conda-forge sentence-transformers -y

# conda install numpy scipy pandas
conda install kaggle scikit-learn lightgbm jupyter matplotlib seaborn opencv joblib tqdm icecream optuna==2.10.1 dask -y
conda install django==3.2 -y
pip install iterative-stratification==0.1.7

# after python installed
brew install --cask google-cloud-sdk
brew install graphviz
python -m nltk.downloader all

# test tensorflow
python tf_test.py

# test pytorch
python torch_test.py