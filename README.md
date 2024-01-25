# Speed up and clean up your react projects with this shadcn-lazy-importer!

I hate a 💩-load of imports, and always forget the npx shad command.


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

Either clone this repo or copy the `update-import.js` and `add-components.sh` to your root dir. Feel free to rename add-components to whatever you feel like. Cool people do something like `echo "alias addshad='./add-components.sh'" | cat - ~/.zshrc > temp && mv temp ~/.zshrc ; && source ~/.zshrc` which allows to type addshad *COMPONENTNAME* only. `.sh` might require you to run `chmod +x ./add-components.sh`.

Das it.
