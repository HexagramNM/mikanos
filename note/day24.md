- (osbook_day24c) SetupPML4でタスク切り替え時にCR3レジスタを戻せるように設定しているが、
この設定中に割り込みが発生するのはまずくないのか？（前後でsti, ctiすべき？）

    - これまでのTaskコンテキストの設定でも別に割り込み禁止にしていなかったので、良いのかな？

- [osbook_day24e] git diffにはないが、show_window_で分岐せず、window_にアクセスしている部分がいくつかある。
特に最初の`InputKey`呼び出し時のものは、実際簡単にヌルポへのアクセスが起こりうるので、分岐条件をつけておくべき。（つけなくても動作はしていたが）

    - `Terminal::InputKey`呼び出し時に`'\n'`のときに実行される箇所にある`draw_area.size = window_->InnerSize();`
    - `Scroll1`メソッドの後半
    - `Terminal::Print(const char* s, std::optional<size_t> len)`のコメント`// 文字列を書き込んだ行全体を再描画している。`以降の処理
    - `HistoryUpDown`メソッドで`FillRectangle`を呼んでいる部分
    - `HistoryUpDown`メソッドで`WriteString`を呼んでいる部分
