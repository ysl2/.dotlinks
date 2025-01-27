# Aerospace

## Installation

1. For aerospace

```bash
brew install --cask nikitabobko/tap/aerospace
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer
```

2. For jankyborders and skechybar

```bash
brew tap FelixKratz/formulae
brew install borders
brew services start borders

brew install sketchybar --HEAD
brew install switchaudio-osx
brew services start sketchybar
```
