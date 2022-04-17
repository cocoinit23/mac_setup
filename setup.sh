# homebrew
# https://brew.sh/index_ja
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# essential
xcode-select --install
sudo softwareupdate --install-rosetta

# iCloud
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/ $HOME/iCloud
echo "alias icloud='cd $HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs'" >>$HOME/.zprofile

# commands
brew install coreutils
brew install watch
brew install wget
brew install tmux

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
brew install --cask bartender
brew install --cask bettertouchtool
brew install --cask alfred
brew install --cask appcleaner
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask webex-meetings
brew install --cask skype
brew install --cask zoom
brew install --cask r
brew install --cask rstudio
brew install --cask mp3gain-express
brew install --cask endnote
brew install --cask cheatsheet
brew install --cask balenaetcher
brew install --cask jetbrains-toolbox
brew install --cask pycharm
brew install --cask intellij-idea
brew install --cask android-file-transfer
brew install --cask docker

# app store
brew install mas
mas install 1333542190 # 1Password
mas install 937984704  # Amphetamine
mas install 425264550  # Disk Speed Test
mas install 1444383602 # GoodNotes
mas install 1319778037 # iStat Menus
mas install 472226235  # LanScan
mas install 539883307  # LINE
mas install 545519333  # Prime Video
mas install 803453959  # Slack
mas install 425424353  # The Unarchiver
mas install 1384080005 # Tweetbot
mas install 882655968  # ZIPANG
mas install 1348617240 # FirstSeed Calendar

# python
brew install --cask miniforge
conda init
echo 'source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh' >>$HOME/.zprofile
source $HOME/.zprofile

conda create --name py38 python=3.8 -y
conda activate py38
echo 'conda activate py38' >>$HOME/.zshrc

# base packages
conda install numpy pandas scipy scikit-learn lightgbm xgboost jupyter matplotlib seaborn opencv -y
conda install joblib umap-learn tqdm icecream pandarallel pillow -y
conda install django==3.2 -y
pip install optuna iterative-stratification

# tensorflow for apple silicon
# https://developer.apple.com/metal/tensorflow-plugin/
conda install -c apple tensorflow-deps -y
pip install tensorflow-macos
pip install tensorflow-metal

# pytorch
conda install -c pytorch pytorch torchvision -y

# hugging face
conda install -c huggingface transformers -y
conda install -c conda-forge sentence-transformers -y

# after python installed
brew install --cask google-cloud-sdk
brew install graphviz

# test Tensorflow
python tf_test.py
