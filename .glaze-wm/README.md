# Glazewm from source (commit: 7e3ffb14cb75f6aed65abba5534070c91e7bc737)

## Installation

> Ref: https://github.com/ysl2/.dotfiles/releases/tag/v0.0.1

```pwsh
git clone git@github.com:glzr-io/glazewm.git
git checkout 7e3ffb14cb75f6aed65abba5534070c91e7bc737
dotnet publish ./GlazeWM.App/GlazeWM.App.csproj --configuration=Release --runtime=win-x64 --output=. --self-contained -p:PublishSingleFile=true -p:IncludeAllContentForSelfExtract=true
```
