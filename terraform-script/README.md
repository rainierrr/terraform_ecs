## ファイル構造

dev環境とprd環境の２つでフォルダを分けている。dev環境とprd環境で構成が変更されることがないと予想されるAWSリソースについてはmodulesを使って共通化を行っている。
```
├── env
│   ├── dev
│   │   ├── dev_main.tf
│   │   ├── dev_output.tf
│   │   ├── dev_preparation.tf
│   │   ├── dev_variable.tf
│   │   ├── result
│   │   │   └── task_detail.json
│   │   ├── run-task.json
│   │   ├── task_definition
│   │   │   └── redmine_dev.json
│   │   ├── terraform.tfstate
│   │   └── terraform.tfstate.backup
│   └── prd
│       ├── prd_main.tf
│       ├── prd_output.tf
│       ├── prd_preparation.tf
│       ├── prd_variable.tf
│       ├── result
│       │   └── task_detail.json
│       ├── run-task.json
│       ├── task_definition
│       │   └── redmine02.json
│       ├── terraform.tfstate
│       └── terraform.tfstate.backup
├── modules
│   ├── ecs
│   │   ├── ecs_main.tf
│   │   ├── ecs_output.tf
│   │   └── ecs_variable.tf
│   ├── efs
│   │   ├── efs_main.tf
│   │   ├── efs_output.tf
│   │   └── efs_variable.tf
│   └── elb
│       └── alb
│           ├── alb_main.tf
│           ├── alb_output.tf
│           └── alb_variable.tf
└── README.md
```