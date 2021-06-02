# terraform_ecs
TerraformによるECS構築の検証
[ファイル構造](https://github.com/rainierrr/terraform_ecs/tree/main/terraform-script)

## AWSサービス構成
このリポジトリでは右上の四角で囲まれた部分のみのせている。
![aws](https://user-images.githubusercontent.com/49901874/120494084-76f3ea80-c3f6-11eb-940a-2d285ae62a4a.png)


## fmt.shについて
公式が出している`terraform fmt`ではファイルの再帰的なフォーマットをかけることができななかったので、シェルスクリプトを使って再帰的なフォーマットをできるようにした。
以下のコマンドを実行することで、カレントディレクト以下のファイルすべてにフォーマットをかけることができる。
```
./fmt.sh
```