# UniGenSW
SwiftPMつかってCLIツールつくってみたかった（笑）

## なにこれ？

Unityでプロジェクトを作ってると...  
毎回同じフォルダ構成にしたり...
いつものアセットをインポートしたり...

めんどいね？

ということで、そこらへんをやってくれるCLIツールです（それだけ

## 使い方

1. Unityで普通にプロジェクトを作る
1. [ここ](https://github.com/anzfactory/UniGenSW/releases/latest)から`anz-unigen`をDL
1. ここからはターミナルで作業

```
$ cd YourUnityProjectPath
$ anz-unigen init
$ anz-unigen gen
```

`anz-unigen`は直接そこのパスを指定して実行してもいいし、パス通してもいいし...お好きなもので

### 設定

`anz-unigen init`を実行すると`unigen.json`というファイルができるので  
そこを編集してもろもろ設定していきます  
デフォルトだと以下のような感じ

    {
        "ProjectName" : "YourProjectName",
        "CustomPackages" : [

        ],
        "Assets" : [
            "Scripts",
            "Resources"
        ],
        "StandardPackages" : [

        ]
    }

* ProjectName: そのままプロジェクト名（ただし使っていない（笑）  
* CustomPackages: CustomPackageのインポート指定（フルパスで指定してください）  
* Assets: フォルダ構成を指定（"Scripts/Utils"という感じで階層も指定できます）  
* StandardPackages: Unityで標準でついてくるPackageをのインポート指定（例：CamerasとかEffectsとか）

StandardPackagesはぶっちゃけ、フルパス指定するならCustomPackageの方にかいてもok

これらを踏まえての例は以下のような感じ

    {
        "ProjectName" : "YourProjectName",
        "CustomPackages" : [
            "~/Downloads/Yoshinani.unitypackage"
        ],
        "Assets" : [
            "Scripts",
            "Resources/Sprites",
            "Resources/Prefabs",
            "Scenes"
        ],
        "StandardPackages" : [
            "Cameras",
            "Effects"
        ]
    }

こうして`anz-unigen gen`を実行するとその設定にそってフォルダ構成をつくってアセットをインポートする

この設定を使いまわすときは別プロジェクトに`unigen.json`をコピーして`anz-unigen gen`を実行したらok  
（`init`はjsonファイル作るだけのやつなので）

## ライセンス

MIT
