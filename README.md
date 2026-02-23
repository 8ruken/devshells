# devshells

8ruken 専用の開発環境です。

## Nix install

Nix のインストール方法(WSL)

### systemd の有効化

systemd を有効化します。

```
sudo cat << '_EOF_' >>
[boot]
systemd=true
_EOF_
```

### Nix のインストール

nix をインストールします。

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
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
