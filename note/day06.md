
- I/O アドレス空間に以下のレジスタがある
    - `CONFIG_ADDRESS`
        - どの PCI Configuration 空間を読み書きしたいかを書く
        - 具体的に何を書くかと言うと:
            - Enable
                - とりあえず立てておくビット
            - バス番号
                - 通常マザーボードの上に複数のバスがあるので、どれであるかを指定するために使う
            - デバイス番号
                - バスに繋がっているデバイスに対して振られる、バスについてユニークなID
            - ファンクション番号
                - デバイスが持つ機能の大まかな種別を表す
                - あるデバイスに対して複数存在する場合があり、そのときはファンクションに対して1つずつ Configuration 空間が存在する
                - デバイスがいくつのファンクションを持つにせよ 0 は必ず存在する
            - レジスタオフセット
                - 256byte ある空間のうち、どの 32bit を読みたいかを指定する
    - `CONFIG_DATA`
- PCI Configuration 空間
    - Header Type
        - 8ビット整数。ビット7がマルチファンクションデバイスであるかどうかのフラグ。
        - bus, device, function = 0, 0, 0 が…
            - 単機能デバイスならば、そのデバイスは bus = 0 のホストブリッジ
            - マルチファンクションならば、そのデバイスは bus = function のホストブリッジ
- bus, device = 0, 0 はホストブリッジ

---

# 単機能デバイスの場合

- bus: 0
    - device: 0 (host bridge)
        - function:
    - device: (mouse)
        - function: (mouse)

# マルチファンクションデバイスの場合

- bus: 0
    - device: 0 (host bridge)
        - function: 0 (host bridge for bus 0)
        - function: 1 (host bridge for bus 1)
        - function: 2 (host bridge for bus 2)
    - device: ???
- bus: 1
    - ...
- bus: 2
    - ...
