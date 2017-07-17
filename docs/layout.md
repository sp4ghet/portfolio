# Project Layout/Tree

```tree
.
├── assets
│   ├── css
│   │   └── ...
│   └── img
│       └── ...
├── docs
│   └── layout.md
├── elm-package.json
└── src
    ├── App.elm
    ├── State.elm
    ├── Types.elm
    ├── View.elm
    ├── Feature1
    │   ├── State.elm
    │   ├── Types.elm
    │   └── View.elm
    └── Feature2
        ├── State.elm
        ├── Types.elm
        ├── View.elm
        └── Rest.elm
```

Each feature should be its own directory (CamelCase) and have at least 3 files. `State`, `Types`, `View`. If you are using Effects, we can add a `Rest`.
