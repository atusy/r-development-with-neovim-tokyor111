# NeovimでR言語やってこうとしてる話

## Atusyってだれよ？

- 著書: [Rが生産性を高める]
- 色んなRパッケージ作ってるったりメンテしたり
    - 代表作
        - [felp]：Rでヘルプを使いやすくする
        - [ftExtra]：flextableでマークダウン記法を使えるようにしたりする
        - [minidown]：R Markdownで軽量＆高機能なHTMLレポートを作る
    - 関わり深いものに[knitr]、[rmarkdown]など
- 言語
    - R, Python, lua, bash, Go, TypeScript, ...
- エディタ
    - **Neovim**
        - プラグインもちょこちょこ作ってる
- Links:
    - blog: <https://blog.atusy.net>
    - Twitter: <https://twitter.com/Atsushi776>
    - GitHub: <https://github.com/atusy>

## Neovimってなによ？

Vimの親戚。単純にVimより優れているわけではないが色々モダン。

Vimの親戚なので、モードがある。

- ノーマルモード:
    - 基本のモード
    - カーソル移動や文字列の削除やコピー・ペーストなどを行う
- インサートモード:
    - 文字入力をするモード
    - 入力が終わったらただちにノーマルモードに戻る
- ビジュアルモード:
    - 範囲選択するモード

など

CLIで動作し、軽快で拡張性が高いのも特徴。

ほとんどの人は**RStudio**か**VSCode**で、**Neovim**はRユーザーの1％にも満たないのではないかと思う。

敢えて言おう。Neovimはいいぞ。

なにげにPosit社がQuarto向けのエディタとして扱える。

<https://quarto.org/docs/get-started/>

## Neovimのいいところ

なんたってカッコイイ

### 速く編集できる

> [実践Vim 思考のスピードで編集しよう!]

間違えだらけのFizzBuzzを直してみよう

#### フツーのエディタ風

```r
fizzbuzz <- function(n) {
  if (n %% 3 == 0) {
    return("Buzz")
  }
  if (n %% 5 == 0) {
    return("Fizz")
  }
  if (n %% 15 == 0) {
    return("FizzBuzz")
  }
  return(n)
}
```

#### オレオレVim流

```r
fizzbuzz <- function(n) {
  if (n %% 3 == 0) {
    return("Buzz")
  }
  if (n %% 5 == 0) {
    return("Fizz")
  }
  if (n %% 15 == 0) {
    return("FizzBuzz")
  }
  return(n)
}
```

### LSPの支援が凄い

#### 定義ジャンプ

- ノーマルモードで`gd`を入力すると、カーソル位置にある関数の定義に飛ぶ

```r
plot_mtcars <- function() {
  ggplot2::ggplot(mtcars) +
    ggplot2::aes(wt, mpg) +
    ggplot2::geom_point()
}

plot_mtcars()
```

#### ドキュメント参照

- ノーマルモードで`K`を入力すると、関数のヘルプを見れる
    - もう一回`K`すると、ヘルプの中に入れる
    - roxygenコメントにも対応

```r
#' plot mtcars
#'
#' scatter plot of wt and mpg of mtcars
plot_mtcars <- function() {
  ggplot2::ggplot(mtcars) +
    ggplot2::aes(wt, mpg) +
    ggplot2::geom_point()
}

plot_mtcars()
```

#### 補完

プラグイン次第で前方一致にでもあいまい一致にでもできる。

あいまい一致なら手が滑って`ggplt`になっても大丈夫！

```r
ggpl
```

### 使用言語に依存しない

1つのエディタで色んな言語扱えるのは便利

```python
print("hello")
```

```bash
echo "hello"
```

## Neovimのここが大変

正直、RStudioやVSCodeで満足してるなら無理に挑まなくていいぞ

- 中毒性がある
    - 他のエディタ使うと、Neovimならxxxできるのにぃいいとなりがち
- マッピング（いわゆるキーボードショートカット的なもの）を覚えるのが大変
    - よく使うものから覚えてけばOK
- 設定しないとIDEとしては使いものにならない
    - [LunarVim]とかIDE化したディストリビューションもある
    - ただしQuarto向けの設定は別に必要
- 画像の表示が厳しい……
- Quartoとかでチャンクの実行結果をチャンクの下に表示みたいのが厳しい……

とはいえ、編集はとても捗る

Neovim側でファイルを保存した結果はRStudioにもすぐ反映されるので、実行はRStudioに任すといいぞ

## 実際やってけてる？

- パッケージ開発なら余裕
    - 複数ファイルを同時に開いての編集とかNeovimのほうが楽
- 分析はやっぱRStudioのUIが好き

## Neovim + R を支える技術

- コードのシンタックスハイライトを実現するパーサー
    - [tree-sitter-r](https://github.com/r-lib/tree-sitter-r)
- 様々なエディタで補完やヘルプなどを実現するLSP (Rのパッケージ)
    - [languageserver](https://github.com/REditorSupport/languageserver)
- LSPをmdファイルやqmdファイルで利用する術を与えるプラグイン
    - [otter.nvim](https://github.com/jmbuhr/otter.nvim)
- Quarto向けの便利コマンドなどを提供するプラグイン
    - [quarto-nvim](https://github.com/quarto-dev/quarto-nvim)
- and more...
    - 最近はこの辺りで活動してますw

## ENJOY!

[Rが生産性を高める]: https://gihyo.jp/book/2022/978-4-297-12524-0

[実践Vim 思考のスピードで編集しよう!]: https://www.amazon.co.jp/%E5%AE%9F%E8%B7%B5Vim-%E6%80%9D%E8%80%83%E3%81%AE%E3%82%B9%E3%83%94%E3%83%BC%E3%83%89%E3%81%A7%E7%B7%A8%E9%9B%86%E3%81%97%E3%82%88%E3%81%86-Drew-Neil/dp/4048916599

[felp]: https://github.com/atusy/felp
[ftExtra]: https://github.com/atusy/minidown
[minidown]: https://github.com/atusy/minidown
[knitr]: https://github.com/yihui/knitr
[rmarkdown]: https://github.com/rstudio/rmarkdown
[LunarVim]: https://www.lunarvim.org/
