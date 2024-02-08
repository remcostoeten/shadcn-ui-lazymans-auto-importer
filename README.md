TLDR
```bash filename='cli' 
pwd: ~/sites/shadcn-ui-lazymans-auto-importer/example-app

**./add-component.sh toast**

✔ Component toast already exists. Would you like to overwrite? … yes
✔ Done.

Imports updated in src/components/ui/ui-imports.tsx.

cat src/components/ui/ui-imports.tsx                                                                                         
 File: src/components/ui/ui-imports.tsx
_____________________________________________
 │ import { NavigationMenu } from './NavigationMenu';
 │ import { Toast } from './Toast';
 │ import { Toaster } from './Toaster';
 │ export { NavigationMenu, Toast, Toaster };
```
 
Instead of cloning or manually copying, run this in your root.
```shell
# Download add-components.sh
curl -O https://raw.githubusercontent.com/remcostoeten/shadcn-ui-lazymans-auto-importer/master/example-app/add-components.sh

# Download update-imports.js
curl -O https://raw.githubusercontent.com/remcostoeten/shadcn-ui-lazymans-auto-importer/master/example-app/update-imports.js

```

# Speed up and clean up your react projects with this shadcn-lazy-importer!

Why you ask? I hate a 💩-load of imports, and always forget the npx shad command.

## far from perfect, far from done, but thats life. It works, somewhat.

This allows you to type in the root `./add-component.sh *component*` which can be any shadcn. Which then downloads the component to either `components/ui` or `src/components/ui`. Besides that it creates a `ui-imports.tsx` which handles all the imports and exports which means you can go from having a component like such:
```js
import { Toast} from "@/components/ui/toast"
import { johndeezel } from "@/components/ui/johndeezel"
import { button } from "@/components/ui/button"
import { input } from "@/components/ui/input"

export default function SoDirty() {
}
```
To
```js
import { toast, johndeezel, button, input } from "ui-imports"

export default function SoClean() {
}
```

*insert meme spend 1 day to save 30 sec*

## Getting started

Either clone this repo or copy the `update-import.js` and `add-components.sh` to your root dir. Feel free to rename add-components to whatever you feel like. Cool people do something like `echo "alias addshad='./add-components.sh'" | cat - ~/.zshrc > temp && mv temp ~/.zshrc ; && source ~/.zshrc` which allows to type `addshad *COMPONENTNAME*` only. `.sh` might require you to run `chmod +x ./add-components.sh`.

Das it.
