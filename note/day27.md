- (osbook_day27b) Taskクラスのfiles_はunique_ptrのvectorなのに対し、file_maps_はFileMapping構造体のvectorと違う。

    - files_のFileDescriptorはいわゆる抽象クラスで実際には派生したクラス（TerminalFileDescriptorとかfat::FileDescriptorとか）を入れたい。そうしようとするとポインターで管理する必要がある。（1つの型で指定してしまうとその型のみ対応した配列となってしまう。）

    - 今回のfile_maps_は1種類のFileMappping構造体を扱うので、構造体を対象としたvectorで問題ない。

- C++で標準でメモリマップドファイルはどう利用するのか？

    - POSIX準拠のOSだとsys/mman.hにあるmmapでメモリ上にファイルをマッピングできる。開放はmunmapで
    https://mkguytone.github.io/allocator-navigatable/ch73.html

    - Windowsだとwindows.hにあるCreateFileMappingで作れるっぽい。結構Linuxと違い、OS依存な処理のように見える。
