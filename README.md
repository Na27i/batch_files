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
