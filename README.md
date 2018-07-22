# Gitメモ

## プロジェクト作成
ステージングに追加したもの全てのキャッシュを消す

`$ git rm -r --cached .`

.gitignoreをステージングに追加する

`$ git add .gitignore`

コミットする

`$ git commit -m "first commit."`

developブランチを作成して、移動する

`$ git checkout -b develop`

ワークツリーのファイルを全てステージングに追加する

`$ git add .`

コミットする

`$ git commit -m "Add new project."`

## マージ
マージ先のmasterブランチに移動

`$ git checkout master`

developブランチをマージする

`git merge develop --no-ff`
