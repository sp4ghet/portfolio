# Module layout for "Works"

```tree
.
├── Contents
│   └── Main.elm
├── Project
│   ├── State.elm
│   ├── Types.elm
│   └── View.elm
├── State.elm
├── Styling.elm
├── Types.elm
└── View.elm
```

The main view of the module looks like a simple layout and title of the project.
It gets routed to "#works" in the Router.

There are 2 subdirectories in this module:

- Project
- Contents

The project directory holds code for the details view of the project.

The contents directory holds the actual data for the main view and project details view to look at. Since there can be a lot of text for the description of each project, I've taken it to its own directory..
