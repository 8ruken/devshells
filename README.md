# devshells

8ruken 専用の開発環境です。

## Nix install

Nix のインストール方法(WSL)

```
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

## Rust

rust の環境のセットアップ方法

```
nix develop .#rust
```

プロジェクトのセットアップ方法

```
cargo init --vcs none
```
