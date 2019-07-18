# batch_files
少しでも楽をするために作ったバッチファイルの置き場です．

## texcmp.bat
### 使用方法・仕様
    $ texcmp xxxxx.tex

任意のtexファイルに対してコンパイル，pdfへの変換，pdfファイルの表示の一連の流れを実行します．  
作者の環境ではAdobe Acrobat Readerを使用しています．環境によって適宜書き換えをしてください．

### メッセージ
    //引数無し
    $ texcmp
    > Argument Error.

    //存在しないファイル名
    $ texcmp yyyyy.tex
    > No Such File.

    //コンパイルエラー
    $ texcmp xxxxx.tex
    > Compile Error.

    //コンパイル成功
    $ texcmp xxxxx.tex
    > Compile Sucess.

## texinit.bat
### 使用方法・仕様
    //通常のテンプレート
    $ texinit xxxxx

    //スライド用のテンプレート
    $ texinit xxxxx yyyyy

任意の名前で.texファイルを作成し，Visual Studio Codeで開きます．  
作者はTeXでスライドも作成するので，追加の引数の有無で参照するテンプレートファイルを変えています．

### メッセージ
    //引数無し
    $ texinit
    > Argument Error.

    //テンプレートファイルが存在しない場合
    $ texinit xxxxx
    > No Templete File.

    //すでに指定された名前のファイルある場合
    $ texinit xxxxx
    > Already Exists.

    //テンプレートファイルのコピーに失敗した場合
    $ texinit xxxxx
    > Copy Error.

    //成功時(メッセージは出ません)
    $ texinit xxxxx