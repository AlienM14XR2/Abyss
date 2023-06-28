# Abyss

「アセンブリ言語」を調べながら学んでみる。
どこまで、最初の学習で理解できるのか全く想像できないが、私は頭が悪いし要領もよくない。
何度も躓き、戻ることを繰り返すのだろうな。

構文（Syntax）、意味（Semantics）、用法（Pragmatics）言語の主な構成要素だ。

## 汎用レジスタ
名前                  別名                      
r0          rax         一種の「アキュムレータ」（Accumulator）として算術命令で使われる。たとえば
                        div 命令は 2 つの整数での除算に使われるが、1 個のオペランドを取るだけで、
                        第 2 のオペランドに rax が暗黙のうちに使われる。 div rcx を実行すると、2 つのレジスタ、
                        rdx と rax に分割して入れた 128 ビット長の大きな数を rcx で割った結果が、rax に書かれる。

r3          rbx         「ベース」(base) レジスタ。初期のプロセッサモデルで、ベースアドレスに使われたことから。

r1          rcx         ループの回数 (cycles) に使われる。
r2          rdx         入出力処理の間、データ (data) を格納する。
r4          rsp         スタックポインタ。ハードウェアスタックのもっとも上にある要素のアドレスを格納する。

r5          rbp         スタックフレームのベースポインタ。
r6          rsi         ストリング操作コマンド（たとえば movsd）のソース側インデックス。
r7          rdi         ストリング操作コマンド（たとえば movsd）のデスティネーション側インデックス。

r8...r15    なし        後に追加された。ほとんどが一時的な値の格納に使われる。ただし、ときには暗黙のうちに使われる。
                       たとえば r10 は syscall 命令が実行されるとき、CPU フラグの保存に使われる。
                       
