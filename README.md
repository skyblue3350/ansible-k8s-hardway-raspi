# ansible-k8s-hardway-raspi

## setup for ansible

デフォルトユーザーに公開鍵を転送

```
make ssh-copy-id USERNAME=ubuntu TARGET=192.0.2.10
```

デフォルトユーザーと任意の管理用アカウントを差し替え
`${USER}` 変数のユーザーを作成する

```
make setup-user INVENTORY=./inventories/sample.yaml TARGET=all USERNAME=ubuntu
```

## setup k8s

```
ansible-playbook -i ./inventories/sample.yaml -l all site.yaml
```
