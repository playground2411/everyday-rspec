## このプロジェクトの説明
- railsを動かすためのシンプルなプロジェクト。
- mainブランチは常にシンプル最小限に。
  - 個別の開発や検証はブランチを切ってやる。

## サイトの立ち上げ方
1. `$ git clone git@github.com:playground2411/everyday-rspec.git`
2. `$ cd everyday-rspec`
3. `$ docker compose up -d`
4. サイトにアクセス
   - http://localhost:3001
   - 上記にアクセスできるはずですが、人によっては異なるかもしれません。
   - とりあえず、3001番ポートでアクセスできるはずです。


## メモ
- [サンプルコード](https://github.com/everydayrails/everydayrails-rspec-2017)

## 実行したコマンド
```bash
bundle install
rails g rspec:install
bundle exec rspec
```