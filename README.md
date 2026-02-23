# devshells

8ruken 専用の開発環境です。

## Nix install

Nix のインストール方法(WSL)

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

公式インストーラーでインストールすると Nix Flakes がデフォルトで有効化されていないので
[nix-installer](https://github.com/DeterminateSystems/nix-installer) を使用します。

## Rust

rust の環境のセットアップ方法

```
nix develop .#rust
```

プロジェクトのセットアップ方法

```
cargo init --vcs none
```
