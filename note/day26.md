- terminal.cppのTerminalfileDescriptor::Readでtask_.Sleep()したあと、
__asm__("sti");をせずに、continueしているが、割り込みを戻さなくて大丈夫か？
（main.cppのwhileループだと、__asm__("sti");をしてから、continueしてる。）

- EOTのところでkeycodeが7のときにCtrl + Dと判定しているが、このkeycodeは
キーボードのハンドラから渡されたkeycodeをそのまま使っているはずなので、
おそらくドライバー側でそのようになるよう処理をしていそう。
