## herokuへデプロイしたときのソースコードを保存しておくブランチ

## setup
```
docker compose build
```
```
docker compose run --rm web bin/setup
```
```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

```
docker compose exec web bash
```
```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```

http://localhost:3000

## Ubuntuファイル編集できるようにする
```
sudo chmod -R 777 /home/okuyama/hc_twitter_clone/
```

```
docker compose run --rm web bundle exec rubocop -A
```

```
docker compose run --rm web bin/htmlbeautifier
```
erbをslimに変換
erbファイルの末尾に「_(アンダースコア)」をつける。こうすることでerbファイルは読み込まれなくなります。
```
erb2slim app/views/
```
元のerbファイルを削除
```
erb2slim app/views/ -d
```
これで元のファイルを編集できる。
```
vim /usr/local/bundle/gems/html2slim-0.2.0/lib/html2slim/converter.rb
```

ブランチの削除
ローカル
git branch -d twitter-sub

リモート
git push origin --delete twitter-sub


## 備考

- Taskのscaffoldが含まれていますが、CIの動作確認用です。
適宜削除いただければと思います。（そのままでも問題ないです）

## rubocop

rubocopがすべて通ってからレビュー依頼を出してください。

auto correct

```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

erbのフォーマッターです。
フォーマッターを通してからレビュー依頼を出してください。

```
docker compose run --rm web bin/htmlbeautifier
```
