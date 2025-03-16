# Glazewm from source (commit: 52b9ee9c8071)

## Installation

```pwsh
git clone git@github.com:glzr-io/glazewm.git
git checkout 52b9ee9c8071
dotnet publish ./GlazeWM.App/GlazeWM.App.csproj --configuration=Release --runtime=win-x64 --output=. --self-contained -p:PublishSingleFile=true -p:IncludeAllContentForSelfExtract=true
```
